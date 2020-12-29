import 'package:slacker/classes/model_classes/guide_class.dart';
import 'package:slacker/globals.dart' as globals;

class Area {
  int areaId;
  int parentId;
  String areaName;
  String briefDescription;
  List<Guide> guides;

  Area({
    this.areaId,
    this.parentId,
    this.areaName,
    this.briefDescription,
    this.guides,
  });

  static Area createAreaInstance({
    int areaId,
    int parentId,
    String areaName,
    String briefDescription,
    List<Guide> guides,
  }) {
    return Area(
      areaId: areaId,
      parentId: parentId,
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
    int parentId = await globals.getParentId('Regions', 'regionName', region);
    await globals
        .getChildrenOfParent('Areas', returnColumns, parentId)
        .then((response) async {
      for (var area in response) {
        returnAreas.add(
          Area.createAreaInstance(
            areaName: area['areaName'],
            areaId: area['areaId'],
            briefDescription: area['briefDescription'],
            parentId: area['parentId'],
          ),
        );
      }
    });
    return returnAreas;
  }

  Future<void> addGuides(List<String> returnColumns) async {
    guides = await Guide.getGuidesFromArea(areaName, returnColumns);
  }
}
