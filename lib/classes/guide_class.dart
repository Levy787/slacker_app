class Guide {
  final int id;
  final int parentID;
  final String guideName;
  final String description;
  final String approach;
  final String approachFromHobart;
  final String approachFromLaunceston;
  final String camping;
  final String amenities;
  final String warning;
  final double gpsLat;
  final double gpsLon;
  final List<Highline> highlines;
  final List<Midline> midlines;
  final List<Waterline> waterlines;
  final List<Parkline> parklines;

  Guide({
    this.description,
    this.amenities,
    this.approach,
    this.approachFromHobart,
    this.approachFromLaunceston,
    this.camping,
    this.gpsLat,
    this.gpsLon,
    this.guideName,
    this.id,
    this.parentID,
    this.warning,
    this.highlines,
    this.midlines,
    this.waterlines,
    this.parklines,
  });
}
