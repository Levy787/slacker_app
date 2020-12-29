import 'package:slacker/classes/model_classes/area_class.dart';
import 'package:slacker/globals.dart' as globals;

class Region {
  int regionId;
  int parentId;
  String regionName;
  String briefDescription;
  List<Area> areas;

  Region({
    this.regionId,
    this.parentId,
    this.regionName,
    this.briefDescription,
    this.areas,
  });

  static Region createRegionInstance({
    int regionId,
    int parentId,
    String regionName,
    String briefDescription,
    List<Area> areas,
  }) {
    return Region(
      regionId: regionId,
      parentId: parentId,
      regionName: regionName,
      briefDescription: briefDescription,
      areas: areas,
    );
  }

  static Future<List<Region>> getRegionsFromState(
    String state,
    List<String> returnColumns,
  ) async {
    List<Region> returnRegions = [];
    int parentId = await globals.getParentId('States', 'stateName', state);
    await globals
        .getChildrenOfParent('Regions', returnColumns, parentId)
        .then((response) async {
      for (var region in response) {
        returnRegions.add(
          Region.createRegionInstance(
            regionName: region['regionName'],
            regionId: region['id'],
            briefDescription: region['briefDescription'],
            parentId: region['parentId'],
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
