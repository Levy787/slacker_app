import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

//TODO: Maybe implement a typedef for the selectChildrenOfParent

class HighlineDbProvider {
  static const currentDatabaseVersion = 1;
  Database db;

  Future<void> init() async {
    String localDatabasePath = 'assets/database/database.db';

    //Internal database path
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");
    db = await openDatabase(path);

    if (await db.getVersion() < currentDatabaseVersion) {
      //TODO: Get information from profile table, just update highlines and what not
      print('Database version out of date, creating a new one');
      db.close();
      //If exists delete otherwise continue
      await deleteDatabase(path);

      await checkParentDirectoryExists(path);

      ByteData data = await getByteDataFromLocalDatabase(localDatabasePath);
      List<int> bytes = databaseByteDataToList(data);

      await writeBytesToInternalDatabase(path, bytes);

      // open the database
      db = await openDatabase(path);
      db.setVersion(currentDatabaseVersion);
    } else {
      print('Database is fine');
    }
  }

  Future<Map<String, Map<String, Map<String, List<String>>>>>
      getGuideSelectJSON(String country) async {
    Map<String, Map<String, Map<String, List<String>>>> stateDetails = {};

    //Add States
    await getStatesInCountry(country).then(
      (states) {
        states.forEach(
          (state) {
            stateDetails[state] = {};
          },
        );
      },
    );

    //Add Regions to State
    for (var state in stateDetails.keys) {
      await getRegionsInState(state).then(
        (regions) {
          regions.forEach(
            (region) {
              stateDetails[state][region] = {};
            },
          );
        },
      );
    }

    //Add Areas to Region
    for (var state in stateDetails.keys) {
      for (var region in stateDetails[state].keys) {
        await getAreasInRegion(region).then(
          (areas) {
            areas.forEach(
              (area) {
                stateDetails[state][region][area] = [];
              },
            );
          },
        );
      }
    }

    //Add Guides to Area
    for (var state in stateDetails.keys) {
      for (var region in stateDetails[state].keys) {
        for (var area in stateDetails[state][region].keys) {
          await getGuidesInArea(area).then(
            (guides) {
              guides.forEach(
                (guide) {
                  stateDetails[state][region][area].add(guide);
                },
              );
            },
          );
        }
      }
    }
    return stateDetails;
  }

  Future<Map<String, Map<String, Map<String, List<String>>>>>
      getStateDetailData(String state) async {
    Map<String, Map<String, Map<String, List<String>>>> stateDetails = {
      state: {}
    };

    for (var state in stateDetails.keys) {
      await getRegionsInState(state).then(
        (regions) {
          regions.forEach(
            (region) {
              stateDetails[state][region] = {};
            },
          );
        },
      );
    }

    //Add Areas to Region
    for (var state in stateDetails.keys) {
      for (var region in stateDetails[state].keys) {
        await getAreasInRegion(region).then(
          (areas) {
            areas.forEach(
              (area) {
                stateDetails[state][region][area] = [];
              },
            );
          },
        );
      }
    }

    //Add Guides to Area
    for (var state in stateDetails.keys) {
      for (var region in stateDetails[state].keys) {
        for (var area in stateDetails[state][region].keys) {
          await getGuidesInArea(area).then(
            (guides) {
              guides.forEach(
                (guide) {
                  stateDetails[state][region][area].add(guide);
                },
              );
            },
          );
        }
      }
    }
    return stateDetails;
  }

/*
  Future<Map<String, Map<String, Map<String, List<String>>>>> getGuideData(
      String guide) async {
    Map<String, Map<String, Map<String, List<String>>>> stateDetails = {
      state: {}
    };

    for (var state in stateDetails.keys) {
      await getRegionsInState(state).then(
        (regions) {
          regions.forEach(
            (region) {
              stateDetails[state][region] = {};
            },
          );
        },
      );
    }

    //Add Areas to Region
    for (var state in stateDetails.keys) {
      for (var region in stateDetails[state].keys) {
        await getAreasInRegion(region).then(
          (areas) {
            areas.forEach(
              (area) {
                stateDetails[state][region][area] = [];
              },
            );
          },
        );
      }
    }

    //Add Guides to Area
    for (var state in stateDetails.keys) {
      for (var region in stateDetails[state].keys) {
        for (var area in stateDetails[state][region].keys) {
          await getGuidesInArea(area).then(
            (guides) {
              guides.forEach(
                (guide) {
                  stateDetails[state][region][area].add(guide);
                },
              );
            },
          );
        }
      }
    }
    return stateDetails;
  }*/

  Future<List<dynamic>> getStatesInCountry(String country) async {
    return await getChildrenItemsFromParent(
      parentName: country,
      childReturnCol: 'stateName',
      childTable: 'States',
      parentColName: 'countryName',
      parentTable: 'Countries',
    );
  }

  Future<List<dynamic>> getRegionsInState(String state) async {
    return await getChildrenItemsFromParent(
      parentName: state,
      childReturnCol: 'regionName',
      childTable: 'Regions',
      parentColName: 'stateName',
      parentTable: 'States',
    );
  }

  Future<List<dynamic>> getAreasInRegion(String region) async {
    return await getChildrenItemsFromParent(
      parentName: region,
      childReturnCol: 'areaName',
      childTable: 'Areas',
      parentColName: 'regionName',
      parentTable: 'Regions',
    );
  }

  Future<List<dynamic>> getGuidesInArea(String area) async {
    return await getChildrenItemsFromParent(
      parentName: area,
      childReturnCol: 'guideName',
      childTable: 'Guides',
      parentColName: 'areaName',
      parentTable: 'Areas',
    );
  }

  Future<List<dynamic>> getGuideAreasInGuide(String guide) async {
    return await getChildrenItemsFromParent(
      parentName: guide,
      childReturnCol: 'guideAreaName',
      childTable: 'GuideAreas',
      parentColName: 'guideName',
      parentTable: 'Guides',
    );
  }

  Future<List<dynamic>> getHighlinesInGuideArea(String guideArea) async {
    return await getChildrenItemsFromParent(
      parentName: guideArea,
      childReturnCol: 'id',
      childTable: 'Highlines',
      parentColName: 'guideAreaName',
      parentTable: 'GuideAreas',
    );
  }

  Future<List<dynamic>> getMidlinesInGuideArea(String guideArea) async {
    return await getChildrenItemsFromParent(
      parentName: guideArea,
      childReturnCol: 'id',
      childTable: 'Midlines',
      parentColName: 'guideAreaName',
      parentTable: 'GuideAreas',
    );
  }

  Future<List<dynamic>> getWaterlinesInGuideArea(String guideArea) async {
    return await getChildrenItemsFromParent(
      parentName: guideArea,
      childReturnCol: 'id',
      childTable: 'Waterlines',
      parentColName: 'guideAreaName',
      parentTable: 'GuideAreas',
    );
  }

  Future<List<dynamic>> getParklinesInGuideArea(String guideArea) async {
    return await getChildrenItemsFromParent(
      parentName: guideArea,
      childReturnCol: 'id',
      childTable: 'Parklines',
      parentColName: 'guideAreaName',
      parentTable: 'GuideAreas',
    );
  }

  Future<List<dynamic>> getChildrenItemsFromParent({
    String parentTable,
    String parentColName,
    String parentName,
    String childTable,
    String childReturnCol,
  }) async {
    List childrenList = [];
    final childrenMap = await db.rawQuery('''
    SELECT $childReturnCol FROM $childTable
    WHERE parentID = (SELECT id FROM $parentTable WHERE $parentColName = '$parentName');
    ''');
    childrenMap.forEach((child) => childrenList.add(child['$childReturnCol']));
    childrenList.sort();

    return childrenList;
  }

  Future<void> checkParentDirectoryExists(var path) async {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print(e); //TODO Remove for Production
    }
  }

  Future<ByteData> getByteDataFromLocalDatabase(
      String localDataBasePath) async {
    return await rootBundle.load(join(localDataBasePath));
  }

  List<int> databaseByteDataToList(ByteData data) {
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> writeBytesToInternalDatabase(var path, List<int> bytes) async {
    await File(path).writeAsBytes(bytes, flush: true);
  }
}
