import 'guide_class.dart';
import 'package:slacker/globals.dart' as globals;

class Area {
  int areaId;
  int regionId;
  String areaName;
  String briefDescription;
  List<Guide> guides;

  Area({
    this.areaId,
    this.regionId,
    this.areaName,
    this.briefDescription,
    this.guides,
  });

  static Area createAreaInstance({
    int areaId,
    int regionId,
    String areaName,
    String briefDescription,
    List<Guide> guides,
  }) {
    return Area(
      areaId: areaId,
      regionId: regionId,
      areaName: areaName,
      briefDescription: briefDescription,
      guides: guides,
    );
  }

  static Future<List<Area>> getAreasFromRegion(
    String region,
    List<String> returnColumns,
  ) async {
    List<Area> returnAreas = [];
    int parentId =
        await globals.getParentId('Regions', 'regionId', 'regionName', region);
    await globals
        .getChildrenOfParent('Areas', returnColumns, 'regionId', parentId)
        .then((response) async {
      for (var area in response) {
        returnAreas.add(
          Area.createAreaInstance(
            areaId: area['areaId'],
            regionId: area['regionId'],
            areaName: area['areaName'],
            briefDescription: area['briefDescription'],
          ),
        );
      }
    });
    return returnAreas;
  }

  Future<void> addGuides({List<String> returnColumns}) async {
    guides = await Guide.getGuidesFromArea(areaName, returnColumns);
  }
}
