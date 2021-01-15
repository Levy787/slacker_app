import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:slacker/globals.dart' as globals;

import 'model_classes/state_class.dart';

//TODO: Maybe implement a typedef for the selectChildrenOfParent

class HighlineDbProvider {
  static const currentDatabaseVersion = 3;

  static Future<void> init() async {
    Database db;

    String localDatabasePath = 'assets/database/database.db';

    //Internal database path
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "database.db");
    db = await openDatabase(path);

    if (await db.getVersion() < currentDatabaseVersion) {
      print('Database version out of date, creating a new one');
      db.close();
      //If exists delete otherwise continue
      await deleteDatabase(path);

      await _checkParentDirectoryExists(path);

      ByteData data = await _getByteDataFromLocalDatabase(localDatabasePath);
      List<int> bytes = _databaseByteDataToList(data);
      await _writeBytesToInternalDatabase(path, bytes);

      // open the database
      db = await openDatabase(path);
      db.setVersion(currentDatabaseVersion);
    } else {
      print('Database is fine');
    }
    globals.db = db;
  }

  static Future<void> _checkParentDirectoryExists(var path) async {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print(e); //TODO Remove for Production
    }
  }

  static Future<ByteData> _getByteDataFromLocalDatabase(
      String localDatabasePath) async {
    return await rootBundle.load(join(localDatabasePath));
  }

  static List<int> _databaseByteDataToList(ByteData data) {
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  static Future<void> _writeBytesToInternalDatabase(
      var path, List<int> bytes) async {
    await File(path).writeAsBytes(bytes, flush: true);
  }

  static Future<States> getActiveStateCache(String state) async {
    States _state = await States.getState(state);
    await _state.addRegions();
    for (var region in _state.regions) {
      await region.addAreas();
      for (var area in region.areas) {
        await area.addGuides();
        for (var guide in area.guides) {
          await guide.addGuideAreas();
          for (var guideArea in guide.guideAreas) {
            await guideArea.addHighlines();
          }
        }
      }
    }
    return _state;
  }

/*  Future<Map<String, dynamic>> getGuideSelectScreenData(
      String countryName) async {
    Map<String, dynamic> json = {
      countryName: {'states': {}}
    };

    ///The flag variable is used to skip all loops if there is no regions etc.
    ///When flag is set to true, all inner loops will not be run and the most
    ///outer loop will run the next iteration.
    bool flag;

    for (var countryName in json.keys) {
      flag = false;
      //Add States to Country
      flag = await getStatesAndAddToJson(json: json, countryName: countryName);

      if (flag == false) {
        for (var stateName in json[countryName]['states'].keys) {
          //Add Regions to State
          flag = await getRegionsAndAddToJson(
            json: json,
            countryName: countryName,
            stateName: stateName,
          );
          if (flag == false) {
            //Add Areas to Region
            for (var regionName
                in json[countryName]['states'][stateName]['regions'].keys) {
              flag = await getAreasAndAddToJson(
                json: json,
                countryName: countryName,
                stateName: stateName,
                regionName: regionName,
              );
              if (flag == false) {
                //Add Guides to Area
                for (var areaName in json[countryName]['states'][stateName]
                        ['regions'][regionName]['areas']
                    .keys) {
                  await getGuidesAndAddToJson(
                    json: json,
                    countryName: countryName,
                    stateName: stateName,
                    regionName: regionName,
                    areaName: areaName,
                  );
                }
              }
            }
          }
        }
      }
    }
    print(json['Australia']['states'].keys);
    return json;
  }

  Future<int> getParentId(
      String parentTableName, String columnMatch, String nameMatch) async {
    int parentId;

    await db
        .query(
          parentTableName,
          columns: ['id'],
          where: '$columnMatch = ?',
          whereArgs: [nameMatch],
        )
        .then(
          (response) => parentId = response[0]['id'],
        );
    return parentId;
  }

  Future<List<String>> getChildrenOfParent(
      String childTable, String returnColumns, int parentId) async {
    List<String> children = [];
    await db
        .query(
          childTable,
          columns: [returnColumns],
          where: 'parentId = ?',
          whereArgs: [parentId],
        )
        .then(
          (response) => response.forEach(
            (child) {
              children.add(
                child[returnColumns],
              );
            },
          ),
        );
    return children;
  }

  Map<String, dynamic> addStatesToCountryJson(
      {Map json, List states, String countryName}) {
    states.forEach(
      (state) {
        json[countryName]['states'][state] = {};
      },
    );
    return json;
  }

  Map<String, dynamic> addRegionsToStateJson(
      {Map json, List regions, String countryName, String stateName}) {
    regions.forEach(
      (region) {
        json[countryName]['states'][stateName]['regions'][region] = {};
      },
    );
    return json;
  }

  Map<String, dynamic> addAreasToRegionJson(
      {Map json,
      List areas,
      String countryName,
      String stateName,
      String regionName,
      String areaName}) {
    areas.forEach(
      (area) {
        json[countryName]['states'][stateName]['regions'][regionName]['areas']
            [area] = {};
      },
    );
    return json;
  }

  Map<String, dynamic> addGuidesToAreaJson(
      {Map json,
      List guides,
      String countryName,
      String stateName,
      String regionName,
      String areaName}) {
    guides.forEach(
      (guide) {
        json[countryName]['states'][stateName]['regions'][regionName]['areas']
            [areaName]['guides'][guide] = {};
      },
    );
    return json;
  }

  Future<bool> getStatesAndAddToJson({
    Map json,
    String countryName,
  }) async {
    int parentId;
    List<String> statesList = [];

    parentId = await getParentId('Countries', 'countryName', '$countryName');
    statesList = await getChildrenOfParent('States', 'stateName', parentId);
    if (statesList.length >= 1) {
      json = addStatesToCountryJson(
        json: json,
        states: statesList,
        countryName: countryName,
      );
      return false;
    } else {
      return true;
    }
  }

  Future<bool> getRegionsAndAddToJson({
    Map json,
    String countryName,
    String stateName,
  }) async {
    List<String> regionsList = [];
    int parentId;

    parentId = await getParentId('States', 'stateName', '$stateName');
    regionsList = await getChildrenOfParent('Regions', 'regionName', parentId);
    if (regionsList.length >= 1) {
      json[countryName]['states'][stateName]['regions'] = {};
      json = addRegionsToStateJson(
        json: json,
        regions: regionsList,
        countryName: countryName,
        stateName: stateName,
      );
      return false;
    } else {
      return true;
    }
  }

  Future<bool> getAreasAndAddToJson({
    Map json,
    String countryName,
    String stateName,
    String regionName,
  }) async {
    List<String> areasList = [];
    int parentId;

    parentId = await getParentId('Regions', 'regionName', '$regionName');

    areasList = await getChildrenOfParent('Areas', 'areaName', parentId);

    if (areasList.length >= 1) {
      json[countryName]['states'][stateName]['regions'][regionName]
          ['areas'] = {};
      json = addAreasToRegionJson(
        json: json,
        areas: areasList,
        countryName: countryName,
        stateName: stateName,
        regionName: regionName,
      );
      return false;
    } else {
      return true;
    }
  }

  Future<bool> getGuidesAndAddToJson({
    Map json,
    String countryName,
    String stateName,
    String regionName,
    String areaName,
  }) async {
    List<String> guidesList = [];
    int parentId;

    parentId = await getParentId('Areas', 'areaName', '$areaName');

    guidesList = await getChildrenOfParent('Guides', 'guideName', parentId);

    if (guidesList.length >= 1) {
      json[countryName]['states'][stateName]['regions'][regionName]['areas']
          [areaName]['guides'] = {};
      json = addGuidesToAreaJson(
        json: json,
        guides: guidesList,
        countryName: countryName,
        stateName: stateName,
        regionName: regionName,
        areaName: areaName,
      );
      return false;
    } else {
      return true;
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
  }*/

  /*Future<List<dynamic>> getChildrenItemsFromParent({
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
  }*/

}
