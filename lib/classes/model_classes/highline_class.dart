import 'package:slacker/globals.dart' as globals;

class Highline {
  int highlineId;
  int parentID;
  int highlineNumber;
  String highlineName;
  int length;
  int height;
  int stars;
  String whoEstablished;
  String whenEstablished;
  String whoFA;
  String whenFA;
  String climbingBeta;
  String warnings;
  String description;
  String tagging;
  String tensionEnd;
  double gpsLatTensionEnd;
  double gpsLonTensionEnd;
  double gpsLatStaticEnd;
  double gpsLonStaticEnd;
  String tensionEndMainAnchor;
  String tensionEndBackupAnchor;
  String staticEndMainAnchor;
  String staticEndBackupAnchor;

  Highline({
    this.highlineId,
    this.parentID,
    this.highlineNumber,
    this.highlineName,
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

  static Highline createHighlineInstance({
    int highlineId,
    int parentID,
    int highlineNumber,
    String highlineName,
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
    return Highline(
      highlineId: highlineId,
      parentID: parentID,
      highlineNumber: highlineNumber,
      highlineName: highlineName,
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

  static Future<List<Highline>> getHighlinesFromGuideArea(
    String guideArea,
    List<String> returnColumns,
  ) async {
    List<Highline> returnHighlines = [];

    int parentId =
        await globals.getParentId('GuideAreas', 'guideAreaName', guideArea);
    await globals
        .getChildrenOfParent('Highlines', returnColumns, parentId)
        .then((response) async {
      for (var highline in response) {
        returnHighlines.add(
          Highline.createHighlineInstance(
            highlineId: highline['highlineId'],
            parentID: highline['parentID'],
            highlineNumber: highline['highlineNumber'],
            highlineName: highline['highlineName'],
            length: highline['length'],
            height: highline['height'],
            stars: highline['stars'],
            whoEstablished: highline['whoEstablished'],
            whenEstablished: highline['whenEstablished'],
            whoFA: highline['whoFA'],
            whenFA: highline['whenFA'],
            climbingBeta: highline['climbingBeta'],
            warnings: highline['warnings'],
            description: highline['description'],
            tagging: highline['tagging'],
            tensionEnd: highline['tensionEnd'],
            gpsLatTensionEnd: highline['gpsLatTensionEnd'],
            gpsLonTensionEnd: highline['gpsLonTensionEnd'],
            gpsLatStaticEnd: highline['gpsLatStaticEnd'],
            gpsLonStaticEnd: highline['gpsLonStaticEnd'],
            tensionEndMainAnchor: highline['tensionEndMainAnchor'],
            tensionEndBackupAnchor: highline['tensionEndBackupAnchor'],
            staticEndMainAnchor: highline['staticEndMainAnchor'],
            staticEndBackupAnchor: highline['staticEndBackupAnchor'],
          ),
        );
      }
    });
    return returnHighlines;
  }
}
