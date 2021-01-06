import 'package:slacker/classes/model_classes/area_class.dart';
import 'package:slacker/globals.dart' as globals;

class Region {
  int regionId;
  int stateId;
  String regionName;
  String briefDescription;
  String detailedDescription;
  String history;
  String ethics;
  String camping;
  String facilities;
  String amenities;
  String weather;
  List<Area> areas;

  Region({
    this.regionId,
    this.stateId,
    this.regionName,
    this.briefDescription,
    this.detailedDescription,
    this.history,
    this.ethics,
    this.camping,
    this.facilities,
    this.amenities,
    this.weather,
    this.areas,
  });

  static Region createRegionInstance({
    int regionId,
    int stateId,
    String regionName,
    String briefDescription,
    String detailedDescription,
    String history,
    String ethics,
    String camping,
    String facilities,
    String amenities,
    String weather,
    List<Area> areas,
  }) {
    return Region(
      regionId: regionId,
      stateId: stateId,
      regionName: regionName,
      briefDescription: briefDescription,
      detailedDescription: detailedDescription,
      history: history,
      ethics: ethics,
      camping: camping,
      facilities: facilities,
      amenities: amenities,
      weather: weather,
      areas: areas,
    );
  }

  static Future<List<Region>> getRegionsFromState(
    String state,
    List<String> returnColumns,
  ) async {
    List<Region> returnRegions = [];
    int parentId =
        await globals.getParentId('States', 'stateId', 'stateName', state);
    await globals
        .getChildrenOfParent('Regions', returnColumns, 'stateId', parentId)
        .then((response) async {
      for (var region in response) {
        returnRegions.add(
          Region.createRegionInstance(
            regionId: region['regionId'],
            stateId: region['stateId'],
            regionName: region['regionName'],
            briefDescription: region['briefDescription'],
            detailedDescription: region['detailedDescription'],
            history: region['history'],
            ethics: region['ethics'],
            camping: region['camping'],
            facilities: region['facilities'],
            amenities: region['amenities'],
            weather: region['weather'],
          ),
        );
      }
    });
    return returnRegions;
  }

  Future<void> addAreas(List<String> returnColumns) async {
    areas = await Area.getAreasFromRegion(regionName, returnColumns);
  }
}
