import 'package:slacker/globals.dart' as globals;

class Highline {
  int highlineId;
  int guideSectionId;
  String highlineName;
  int length;
  int height;
  int exposure;
  int stars;
  int approachTime;
  String whoEstablished;
  String whenEstablished;
  String whoFA;
  String whenFA;
  String climbingBeta;
  String warnings;
  String description;
  String tagging;
  String tensionEnd;
  double tensionEndLat;
  double tensionEndLon;
  double staticEndLat;
  double staticEndLon;
  String tensionEndMainAnchor;
  String tensionEndBackupAnchor;
  String staticEndMainAnchor;
  String staticEndBackupAnchor;

  Highline({
    this.highlineId,
    this.guideSectionId,
    this.highlineName,
    this.length,
    this.height,
    this.exposure,
    this.stars,
    this.approachTime,
    this.whoEstablished,
    this.whenEstablished,
    this.whoFA,
    this.whenFA,
    this.climbingBeta,
    this.warnings,
    this.description,
    this.tagging,
    this.tensionEnd,
    this.tensionEndLat,
    this.tensionEndLon,
    this.staticEndLat,
    this.staticEndLon,
    this.tensionEndMainAnchor,
    this.tensionEndBackupAnchor,
    this.staticEndMainAnchor,
    this.staticEndBackupAnchor,
  });

  static Highline createHighlineInstance({
    int highlineId,
    int guideSectionId,
    String highlineName,
    int length,
    int height,
    int exposure,
    int stars,
    int approachTime,
    String whoEstablished,
    String whenEstablished,
    String whoFA,
    String whenFA,
    String climbingBeta,
    String warnings,
    String description,
    String tagging,
    String tensionEnd,
    double tensionEndLat,
    double tensionEndLon,
    double staticEndLat,
    double staticEndLon,
    String tensionEndMainAnchor,
    String tensionEndBackupAnchor,
    String staticEndMainAnchor,
    String staticEndBackupAnchor,
  }) {
    return Highline(
      highlineId: highlineId,
      guideSectionId: guideSectionId,
      highlineName: highlineName,
      length: length,
      height: height,
      exposure: exposure,
      stars: stars,
      approachTime: approachTime,
      whoEstablished: whoEstablished,
      whenEstablished: whenEstablished,
      whoFA: whoFA,
      whenFA: whenFA,
      climbingBeta: climbingBeta,
      warnings: warnings,
      description: description,
      tagging: tagging,
      tensionEnd: tensionEnd,
      tensionEndLat: tensionEndLat,
      tensionEndLon: tensionEndLon,
      staticEndLat: staticEndLat,
      staticEndLon: staticEndLon,
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

    int parentId = await globals.getParentId(
        'GuideSections', 'guideSectionId', 'guideSectionName', guideArea);
    await globals
        .getChildrenOfParent(
            'Highlines', returnColumns, 'guideSection', parentId)
        .then((response) async {
      for (var highline in response) {
        returnHighlines.add(
          Highline.createHighlineInstance(
            highlineId: highline['highlineId'],
            guideSectionId: highline['guideSectionId'],
            highlineName: highline['highlineName'],
            length: highline['length'],
            height: highline['height'],
            exposure: highline['exposure'],
            stars: highline['stars'],
            approachTime: highline['approachTime'],
            whoEstablished: highline['whoEstablished'],
            whenEstablished: highline['whenEstablished'],
            whoFA: highline['whoFA'],
            whenFA: highline['whenFA'],
            climbingBeta: highline['climbingBeta'],
            warnings: highline['warnings'],
            description: highline['description'],
            tagging: highline['tagging'],
            tensionEnd: highline['tensionEnd'],
            tensionEndLat: highline['tensionEndLat'],
            tensionEndLon: highline['tensionEndLon'],
            staticEndLat: highline['staticEndLat'],
            staticEndLon: highline['staticEndLon'],
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
