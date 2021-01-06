import 'package:slacker/classes/model_classes/guide_area_class.dart';
import 'package:slacker/globals.dart' as globals;

class Guide {
  int guideId;
  int areaId;
  String guideName;
  String briefDescription;
  String detailedDescription;
  String approach;
  String approachFromHobart;
  String approachFromLaunceston;
  String camping;
  String climbingBeta;
  String tagging;
  String amenities;
  String facilities;
  String warning;
  double guideLat;
  double guideLon;
  List<GuideSections> guideAreas;

  Guide({
    this.guideId,
    this.areaId,
    this.guideName,
    this.briefDescription,
    this.detailedDescription,
    this.approach,
    this.approachFromHobart,
    this.approachFromLaunceston,
    this.camping,
    this.climbingBeta,
    this.tagging,
    this.amenities,
    this.facilities,
    this.warning,
    this.guideLat,
    this.guideLon,
    this.guideAreas,
  });

  static Guide createGuideInstance({
    int guideId,
    int areaId,
    String guideName,
    String briefDescription,
    String detailedDescription,
    String approach,
    String approachFromHobart,
    String approachFromLaunceston,
    String camping,
    String climbingBeta,
    String tagging,
    String amenities,
    String facilities,
    String warning,
    double guideLat,
    double guideLon,
    List<GuideSections> guideAreas,
  }) {
    return Guide(
      guideId: guideId,
      areaId: areaId,
      guideName: guideName,
      briefDescription: briefDescription,
      detailedDescription: detailedDescription,
      approach: approach,
      approachFromHobart: approachFromHobart,
      approachFromLaunceston: approachFromLaunceston,
      camping: camping,
      climbingBeta: climbingBeta,
      tagging: tagging,
      amenities: amenities,
      facilities: facilities,
      warning: warning,
      guideLat: guideLat,
      guideLon: guideLon,
      guideAreas: guideAreas,
    );
  }

  static Future<Guide> getGuide(
    String guide, {
    List<String> returnColumns,
  }) async {
    Guide returnGuide;
    await globals.db.query(
      'Guides',
      columns: returnColumns,
      where: 'guideName = ?',
      whereArgs: [guide],
    ).then((response) {
      for (var guide in response) {
        returnGuide = Guide.createGuideInstance(
          guideId: guide['guideId'],
          areaId: guide['areaId'],
          guideName: guide['guideName'],
          briefDescription: guide['briefDescription'],
          detailedDescription: guide['detailedDescription'],
          approach: guide['approach'],
          approachFromHobart: guide['approachFromHobart'],
          approachFromLaunceston: guide['approachFromLaunceston'],
          camping: guide['camping'],
          climbingBeta: guide['climbingBeta'],
          tagging: guide['tagging'],
          amenities: guide['amenities'],
          facilities: guide['facilities'],
          warning: guide['warning'],
          guideLat: guide['guideLat'],
          guideLon: guide['guideLon'],
          guideAreas: guide['guideAreas'],
        );
      }
    });
    return returnGuide;
  }

  static Future<List<Guide>> getGuidesFromArea(
    String area,
    List<String> returnColumns,
  ) async {
    List<Guide> returnGuides = [];
    int parentId =
        await globals.getParentId('Areas', 'areaId', 'areaName', area);
    await globals
        .getChildrenOfParent('Guides', returnColumns, 'areaId', parentId)
        .then((response) async {
      for (var guide in response) {
        returnGuides.add(
          Guide.createGuideInstance(
            guideId: guide['guideId'],
            areaId: guide['areaId'],
            guideName: guide['guideName'],
            briefDescription: guide['briefDescription'],
            detailedDescription: guide['detailedDescription'],
            approach: guide['approach'],
            approachFromHobart: guide['approachFromHobart'],
            approachFromLaunceston: guide['approachFromLaunceston'],
            camping: guide['camping'],
            climbingBeta: guide['climbingBeta'],
            tagging: guide['tagging'],
            amenities: guide['amenities'],
            facilities: guide['facilities'],
            warning: guide['warning'],
            guideLat: guide['guideLat'],
            guideLon: guide['guideLon'],
            guideAreas: guide['guideAreas'],
          ),
        );
      }
    });
    return returnGuides;
  }

  Future<void> addGuideAreas({List<String> returnColumns}) async {
    guideAreas =
        await GuideSections.getGuideAreasFromGuide(guideName, returnColumns);
  }
}
