import 'package:slacker/classes/model_classes/highline_class.dart';
import 'package:slacker/classes/model_classes/midline_class.dart';
import 'package:slacker/classes/model_classes/waterline_class.dart';
import 'package:slacker/classes/model_classes/parkline_class.dart';
import 'package:slacker/globals.dart' as globals;

class GuideArea {
  int guideAreaId;
  int parentID;
  String guideAreaName;
  String description;
  String approach;
  String climbingBeta;
  String tagging;
  String warning;
  double gpsLat;
  double gpsLon;
  List<Highline> highlines;
  List<Midline> midlines;
  List<Waterline> waterlines;
  List<Parkline> parklines;

  GuideArea({
    this.guideAreaId,
    this.parentID,
    this.guideAreaName,
    this.description,
    this.approach,
    this.climbingBeta,
    this.tagging,
    this.warning,
    this.gpsLat,
    this.gpsLon,
    this.highlines,
    this.midlines,
    this.waterlines,
    this.parklines,
  });

  static GuideArea createGuideAreaInstance({
    int guideAreaId,
    int parentID,
    String guideAreaName,
    String description,
    String approach,
    String climbingBeta,
    String tagging,
    String warning,
    double gpsLat,
    double gpsLon,
  }) {
    return GuideArea(
      guideAreaId: guideAreaId,
      parentID: parentID,
      guideAreaName: guideAreaName,
      description: description,
      approach: approach,
      climbingBeta: climbingBeta,
      tagging: tagging,
      warning: warning,
      gpsLat: gpsLat,
      gpsLon: gpsLon,
    );
  }

  static Future<List<GuideArea>> getGuideAreasFromGuide(
    String guide,
    List<String> returnColumns,
  ) async {
    List<GuideArea> returnGuideAreas = [];

    int parentId = await globals.getParentId('Guides', 'guideName', guide);
    await globals
        .getChildrenOfParent('GuideAreas', returnColumns, parentId)
        .then((response) async {
      for (var guideArea in response) {
        returnGuideAreas.add(
          GuideArea.createGuideAreaInstance(
            guideAreaId: guideArea['guideAreaId'],
            parentID: guideArea['parentID'],
            guideAreaName: guideArea['guideAreaName'],
            description: guideArea['description'],
            approach: guideArea['approach'],
            climbingBeta: guideArea['climbingBeta'],
            tagging: guideArea['tagging'],
            warning: guideArea['warning'],
            gpsLat: guideArea['gpsLat'],
            gpsLon: guideArea['gpsLon'],
          ),
        );
      }
    });
    return returnGuideAreas;
  }

  Future<void> addHighlines(List<String> returnColumns) async {
    highlines =
        await Highline.getHighlinesFromGuideArea(guideAreaName, returnColumns);
  }

  Future<void> addMidlines(List<String> returnColumns) async {
    midlines =
        await Midline.getMidlinesFromGuideArea(guideAreaName, returnColumns);
  }

  Future<void> addWaterlines(List<String> returnColumns) async {
    waterlines = await Waterline.getWaterlinesFromGuideArea(
        guideAreaName, returnColumns);
  }

  Future<void> addParklines(List<String> returnColumns) async {
    parklines =
        await Parkline.getParklinesFromGuideArea(guideAreaName, returnColumns);
  }
}
