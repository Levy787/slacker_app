import 'package:slacker/globals.dart' as globals;

class Waterline {
  final int waterlineId;
  final int parentID;
  final int waterlineNumber;
  final String waterlineName;
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

  Waterline({
    this.waterlineId,
    this.parentID,
    this.waterlineNumber,
    this.waterlineName,
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

  static Waterline createWaterlineInstance({
    int waterlineId,
    int parentID,
    int waterlineNumber,
    String waterlineName,
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
    return Waterline(
      waterlineId: waterlineId,
      parentID: parentID,
      waterlineNumber: waterlineNumber,
      waterlineName: waterlineName,
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

  static Future<List<Waterline>> getWaterlinesFromGuideArea(
    String guideArea,
    List<String> returnColumns,
  ) async {
    List<Waterline> returnWaterlines = [];

    int parentId =
        await globals.getParentId('GuideAreas', 'guideAreaName', guideArea);
    await globals
        .getChildrenOfParent('Waterline', returnColumns, parentId)
        .then((response) async {
      for (var waterline in response) {
        returnWaterlines.add(
          Waterline.createWaterlineInstance(
            waterlineId: waterline['midlineId'],
            parentID: waterline['parentID'],
            waterlineNumber: waterline['highlineNumber'],
            waterlineName: waterline['highlineName'],
            length: waterline['length'],
            height: waterline['height'],
            stars: waterline['stars'],
            whoEstablished: waterline['whoEstablished'],
            whenEstablished: waterline['whenEstablished'],
            whoFA: waterline['whoFA'],
            whenFA: waterline['whenFA'],
            climbingBeta: waterline['climbingBeta'],
            warnings: waterline['warnings'],
            description: waterline['description'],
            tagging: waterline['tagging'],
            tensionEnd: waterline['tensionEnd'],
            gpsLatTensionEnd: waterline['gpsLatTensionEnd'],
            gpsLonTensionEnd: waterline['gpsLonTensionEnd'],
            gpsLatStaticEnd: waterline['gpsLatStaticEnd'],
            gpsLonStaticEnd: waterline['gpsLonStaticEnd'],
            tensionEndMainAnchor: waterline['tensionEndMainAnchor'],
            tensionEndBackupAnchor: waterline['tensionEndBackupAnchor'],
            staticEndMainAnchor: waterline['staticEndMainAnchor'],
            staticEndBackupAnchor: waterline['staticEndBackupAnchor'],
          ),
        );
      }
    });
    return returnWaterlines;
  }
}
