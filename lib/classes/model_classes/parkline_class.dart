import 'package:slacker/globals.dart' as globals;

class Parkline {
  int parklineId;
  int parentID;
  int parklineNumber;
  String parklineName;
  int length;
  int height;
  int stars;
  String warnings;
  String description;
  String tensionEnd;
  double gpsLatTensionEnd;
  double gpsLonTensionEnd;
  double gpsLatStaticEnd;
  double gpsLonStaticEnd;
  String tensionAnchor;
  String staticAnchor;

  Parkline({
    this.parklineId,
    this.parentID,
    this.parklineNumber,
    this.parklineName,
    this.length,
    this.height,
    this.stars,
    this.warnings,
    this.description,
    this.tensionEnd,
    this.gpsLatTensionEnd,
    this.gpsLonTensionEnd,
    this.gpsLatStaticEnd,
    this.gpsLonStaticEnd,
    this.tensionAnchor,
    this.staticAnchor,
  });

  static Parkline createParklineInstance(
      {int parklineId,
      int parentID,
      int parklineNumber,
      String parklineName,
      int length,
      int height,
      int stars,
      String warnings,
      String description,
      String tensionEnd,
      double gpsLatTensionEnd,
      double gpsLonTensionEnd,
      double gpsLatStaticEnd,
      double gpsLonStaticEnd,
      String tensionAnchor,
      String staticAnchor}) {
    return Parkline(
      parklineId: parklineId,
      parentID: parentID,
      parklineNumber: parklineNumber,
      parklineName: parklineName,
      length: length,
      height: height,
      stars: stars,
      warnings: warnings,
      description: description,
      tensionEnd: tensionEnd,
      gpsLatTensionEnd: gpsLatTensionEnd,
      gpsLonTensionEnd: gpsLonTensionEnd,
      gpsLatStaticEnd: gpsLatStaticEnd,
      gpsLonStaticEnd: gpsLonStaticEnd,
      tensionAnchor: tensionAnchor,
      staticAnchor: staticAnchor,
    );
  }

  static Future<List<Parkline>> getParklinesFromGuideArea(
    String guideArea,
    List<String> returnColumns,
  ) async {
    List<Parkline> returnParklines = [];

    int parentId =
        await globals.getParentId('GuideAreas', 'guideAreaName', guideArea);
    await globals
        .getChildrenOfParent('Parkline', returnColumns, parentId)
        .then((response) async {
      for (var parkline in response) {
        returnParklines.add(
          Parkline.createParklineInstance(
            parklineId: parkline['parklineId'],
            parentID: parkline['parentID'],
            parklineNumber: parkline['parklineNumber'],
            parklineName: parkline['parklineName'],
            length: parkline['length'],
            height: parkline['height'],
            stars: parkline['stars'],
            warnings: parkline['warnings'],
            description: parkline['description'],
            tensionEnd: parkline['tensionEnd'],
            gpsLatTensionEnd: parkline['gpsLatTensionEnd'],
            gpsLonTensionEnd: parkline['gpsLonTensionEnd'],
            gpsLatStaticEnd: parkline['gpsLatStaticEnd'],
            gpsLonStaticEnd: parkline['gpsLonStaticEnd'],
            tensionAnchor: parkline['tensionAnchor'],
            staticAnchor: parkline['staticAnchor'],
          ),
        );
      }
    });
    return returnParklines;
  }
}
