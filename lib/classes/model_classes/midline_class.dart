/*
import 'package:slacker/globals.dart' as globals;

class Midline {
  final int midlineId;
  final int parentID;
  final int midlineNumber;
  final String midlineName;
  final int length;
  final int height;
  final int stars;
  final String whoEstablished;
  final String whenEstablished;
  final String whoFA;
  final String whenFA;
  final String climbingBeta;
  final String warnings;
  final String description;
  final String tagging;
  final String tensionEnd;
  final double gpsLatTensionEnd;
  final double gpsLonTensionEnd;
  final double gpsLatStaticEnd;
  final double gpsLonStaticEnd;
  final String tensionEndMainAnchor;
  final String tensionEndBackupAnchor;
  final String staticEndMainAnchor;
  final String staticEndBackupAnchor;

  Midline({
    this.midlineId,
    this.parentID,
    this.midlineNumber,
    this.midlineName,
    this.length,
    this.height,
    this.stars,
    this.whoEstablished,
    this.whenEstablished,
    this.whoFA,
    this.whenFA,
    this.climbingBeta,
    this.warnings,
    this.description,
    this.tagging,
    this.tensionEnd,
    this.gpsLatTensionEnd,
    this.gpsLonTensionEnd,
    this.gpsLatStaticEnd,
    this.gpsLonStaticEnd,
    this.tensionEndMainAnchor,
    this.tensionEndBackupAnchor,
    this.staticEndMainAnchor,
    this.staticEndBackupAnchor,
  });

  static Midline createMidlineInstance({
    int midlineId,
    int parentID,
    int midlineNumber,
    String midlineName,
    int length,
    int height,
    int stars,
    String whoEstablished,
    String whenEstablished,
    String whoFA,
    String whenFA,
    String climbingBeta,
    String warnings,
    String description,
    String tagging,
    String tensionEnd,
    double gpsLatTensionEnd,
    double gpsLonTensionEnd,
    double gpsLatStaticEnd,
    double gpsLonStaticEnd,
    String tensionEndMainAnchor,
    String tensionEndBackupAnchor,
    String staticEndMainAnchor,
    String staticEndBackupAnchor,
  }) {
    return Midline(
      midlineId: midlineId,
      parentID: parentID,
      midlineNumber: midlineNumber,
      midlineName: midlineName,
      length: length,
      height: height,
      stars: stars,
      whoEstablished: whoEstablished,
      whenEstablished: whenEstablished,
      whoFA: whoFA,
      whenFA: whenFA,
      climbingBeta: climbingBeta,
      warnings: warnings,
      description: description,
      tagging: tagging,
      tensionEnd: tensionEnd,
      gpsLatTensionEnd: gpsLatTensionEnd,
      gpsLonTensionEnd: gpsLonTensionEnd,
      gpsLatStaticEnd: gpsLatStaticEnd,
      gpsLonStaticEnd: gpsLonStaticEnd,
      tensionEndMainAnchor: tensionEndMainAnchor,
      tensionEndBackupAnchor: tensionEndBackupAnchor,
      staticEndMainAnchor: staticEndMainAnchor,
      staticEndBackupAnchor: staticEndBackupAnchor,
    );
  }

  static Future<List<Midline>> getMidlinesFromGuideArea(
    String guideArea,
    List<String> returnColumns,
  ) async {
    List<Midline> returnMidlines = [];

    int parentId = await globals.getParentId(
        'GuideSections', 'GuideSectionID', 'guideSectionName', guideArea);
    await globals
        .getChildrenOfParent('Midlines', returnColumns, parentId)
        .then((response) async {
      for (var midline in response) {
        returnMidlines.add(
          Midline.createMidlineInstance(
            midlineId: midline['midlineId'],
            parentID: midline['parentID'],
            midlineNumber: midline['highlineNumber'],
            midlineName: midline['highlineName'],
            length: midline['length'],
            height: midline['height'],
            stars: midline['stars'],
            whoEstablished: midline['whoEstablished'],
            whenEstablished: midline['whenEstablished'],
            whoFA: midline['whoFA'],
            whenFA: midline['whenFA'],
            climbingBeta: midline['climbingBeta'],
            warnings: midline['warnings'],
            description: midline['description'],
            tagging: midline['tagging'],
            tensionEnd: midline['tensionEnd'],
            gpsLatTensionEnd: midline['gpsLatTensionEnd'],
            gpsLonTensionEnd: midline['gpsLonTensionEnd'],
            gpsLatStaticEnd: midline['gpsLatStaticEnd'],
            gpsLonStaticEnd: midline['gpsLonStaticEnd'],
            tensionEndMainAnchor: midline['tensionEndMainAnchor'],
            tensionEndBackupAnchor: midline['tensionEndBackupAnchor'],
            staticEndMainAnchor: midline['staticEndMainAnchor'],
            staticEndBackupAnchor: midline['staticEndBackupAnchor'],
          ),
        );
      }
    });
    return returnMidlines;
  }
}
*/
