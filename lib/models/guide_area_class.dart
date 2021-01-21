import 'highline_class.dart';
import 'package:slacker/globals.dart' as globals;

class GuideSections {
  int guideSectionId;
  int guideId;
  String guideSectionName;
  String briefDescription;
  String detailedDescription;
  String approach;
  String climbingBeta;
  String tagging;
  String warning;
  double guideSectionLat;
  double guideSectionLon;
  List<Highline> highlines;
  //List<Midline> midlines;
  //List<Waterline> waterlines;
  //List<Parkline> parklines;

  GuideSections({
    this.guideSectionId,
    this.guideId,
    this.guideSectionName,
    this.briefDescription,
    this.detailedDescription,
    this.approach,
    this.climbingBeta,
    this.tagging,
    this.warning,
    this.guideSectionLat,
    this.guideSectionLon,
    this.highlines,
    //this.midlines,
    //this.waterlines,
    //this.parklines,
  });

  static GuideSections createGuideAreaInstance({
    int guideSectionId,
    int guideId,
    String guideSectionName,
    String briefDescription,
    String detailedDescription,
    String approach,
    String climbingBeta,
    String tagging,
    String warning,
    double guideSectionLat,
    double guideSectionLon,
    List<Highline> highlines,
    //List<Midline> midlines,
    //List<Waterline> waterlines,
    //List<Parkline> parklines,
  }) {
    return GuideSections(
      guideSectionId: guideSectionId,
      guideId: guideId,
      guideSectionName: guideSectionName,
      briefDescription: briefDescription,
      detailedDescription: detailedDescription,
      approach: approach,
      climbingBeta: climbingBeta,
      tagging: tagging,
      warning: warning,
      guideSectionLat: guideSectionLat,
      guideSectionLon: guideSectionLon,
      highlines: highlines,
      //midlines: midlines,
      //waterlines: waterlines,
      //parklines: parklines,
    );
  }

  static Future<List<GuideSections>> getGuideAreasFromGuide(
    String guide,
    List<String> returnColumns,
  ) async {
    List<GuideSections> returnGuideAreas = [];

    int parentId =
        await globals.getParentId('Guides', 'guideId', 'guideName', guide);
    await globals
        .getChildrenOfParent(
            'guideSections', returnColumns, 'guideId', parentId)
        .then((response) async {
      for (var guideSection in response) {
        returnGuideAreas.add(
          GuideSections.createGuideAreaInstance(
            guideSectionId: guideSection['guideSectionId'],
            guideId: guideSection['guideId'],
            guideSectionName: guideSection['guideSectionName'],
            briefDescription: guideSection['briefDescription'],
            detailedDescription: guideSection['detailedDescription'],
            approach: guideSection['approach'],
            climbingBeta: guideSection['climbingBeta'],
            tagging: guideSection['tagging'],
            warning: guideSection['warning'],
            guideSectionLat: guideSection['guideSectionLat'],
            guideSectionLon: guideSection['guideSectionLon'],
            highlines: guideSection['highlines'],
            //midlines: guideSection['midlines'],
            //waterlines: guideSection['waterlines'],
            //parklines: guideSection['parklines'],
          ),
        );
      }
    });
    return returnGuideAreas;
  }

  Future<void> addHighlines({List<String> returnColumns}) async {
    highlines = await Highline.getHighlinesFromGuideArea(
        guideSectionName, returnColumns);
  }

  /*Future<void> addMidlines({List<String> returnColumns}) async {
    midlines =
        await Midline.getMidlinesFromGuideArea(guideSectionName, returnColumns);
  }

  Future<void> addWaterlines({List<String> returnColumns}) async {
    waterlines = await Waterline.getWaterlinesFromGuideArea(
        guideSectionName, returnColumns);
  }

  Future<void> addParklines({List<String> returnColumns}) async {
    parklines = await Parkline.getParklinesFromGuideArea(
        guideSectionName, returnColumns);
  }*/
}
