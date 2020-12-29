import 'package:slacker/classes/model_classes/guide_area_class.dart';
import 'package:slacker/globals.dart' as globals;

class Guide {
  int guideId;
  int parentID;
  String guideName;
  String description;
  String approach;
  String approachFromHobart;
  String approachFromLaunceston;
  String camping;
  String amenities;
  String warning;
  double gpsLat;
  double gpsLon;
  List<GuideArea> guideAreas;

  Guide({
    this.guideId,
    this.description,
    this.amenities,
    this.approach,
    this.approachFromHobart,
    this.approachFromLaunceston,
    this.camping,
    this.gpsLat,
    this.gpsLon,
    this.guideName,
    this.parentID,
    this.warning,
    this.guideAreas,
  });

  static Guide createGuideInstance({
    int guideId,
    int parentID,
    String guideName,
    String description,
    String approach,
    String approachFromHobart,
    String approachFromLaunceston,
    String camping,
    String amenities,
    String warning,
    double gpsLat,
    double gpsLon,
    List<GuideArea> guideAreas,
  }) {
    return Guide(
      guideId: guideId,
      parentID: parentID,
      guideName: guideName,
      description: description,
      approach: approach,
      approachFromHobart: approachFromHobart,
      approachFromLaunceston: approachFromLaunceston,
      camping: camping,
      amenities: amenities,
      warning: warning,
      gpsLat: gpsLat,
      gpsLon: gpsLon,
      guideAreas: guideAreas,
    );
  }

  static Future<List<Guide>> getGuidesFromArea(
    String area,
    List<String> returnColumns,
  ) async {
    List<Guide> returnGuides = [];
    int parentId = await globals.getParentId('Areas', 'areaName', area);
    await globals
        .getChildrenOfParent('Guides', returnColumns, parentId)
        .then((response) async {
      for (var guide in response) {
        returnGuides.add(
          Guide.createGuideInstance(
            guideId: guide['guideId'],
            parentID: guide['parentID'],
            guideName: guide['guideName'],
            description: guide['description'],
            approach: guide['approach'],
            approachFromHobart: guide['approachFromHobart'],
            approachFromLaunceston: guide['approachFromLaunceston'],
            camping: guide['camping'],
            amenities: guide['amenities'],
            warning: guide['warning'],
            gpsLat: guide['gpsLat'],
            gpsLon: guide['gpsLon'],
          ),
        );
      }
    });
    return returnGuides;
  }

  Future<void> addGuideAreas(List<String> returnColumns) async {
    guideAreas =
        await GuideArea.getGuideAreasFromGuide(guideName, returnColumns);
  }
}
