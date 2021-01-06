import 'package:slacker/classes/model_classes/region_class.dart';
import 'package:slacker/globals.dart' as globals;

class States {
  int stateId;
  int countryId;
  String stateName;
  String briefDescription;
  String detailedDescription;
  String history;
  String ethics;
  String camping;
  String weather;
  String facilities;
  String amenities;
  String survivalGuide;
  String socialMedia;
  String surfing;
  String hiking;
  String climbing;
  String mountainBiking;
  String swimmingHoles;
  List<Region> regions;

  States({
    this.stateId,
    this.countryId,
    this.stateName,
    this.briefDescription,
    this.detailedDescription,
    this.history,
    this.ethics,
    this.camping,
    this.weather,
    this.facilities,
    this.amenities,
    this.survivalGuide,
    this.socialMedia,
    this.surfing,
    this.hiking,
    this.climbing,
    this.mountainBiking,
    this.swimmingHoles,
    this.regions,
  });

  static States createStateInstance({
    int stateId,
    int countryId,
    String stateName,
    String briefDescription,
    String detailedDescription,
    String history,
    String ethics,
    String camping,
    String weather,
    String facilities,
    String amenities,
    String survivalGuide,
    String socialMedia,
    String surfing,
    String hiking,
    String climbing,
    String mountainBiking,
    String swimmingHoles,
    List<Region> regions,
  }) {
    return States(
      stateId: stateId,
      countryId: countryId,
      stateName: stateName,
      briefDescription: briefDescription,
      detailedDescription: detailedDescription,
      history: history,
      ethics: ethics,
      camping: camping,
      weather: weather,
      facilities: facilities,
      amenities: amenities,
      survivalGuide: survivalGuide,
      socialMedia: socialMedia,
      surfing: surfing,
      hiking: hiking,
      climbing: climbing,
      mountainBiking: mountainBiking,
      swimmingHoles: swimmingHoles,
      regions: regions,
    );
  }

  static Future<States> getState(String stateName,
      {List<String> returnColumns}) async {
    States returnState;
    await globals.db.query(
      'States',
      columns: returnColumns,
      where: 'stateName = ?',
      whereArgs: [stateName],
    ).then(
      (response) {
        for (var state in response) {
          returnState = States.createStateInstance(
            stateId: state['stateId'],
            countryId: state['countryId'],
            stateName: state['stateName'],
            briefDescription: state['briefDescription'],
            detailedDescription: state['detailedDescription'],
            history: state['history'],
            ethics: state['ethics'],
            camping: state['camping'],
            weather: state['weather'],
            facilities: state['facilities'],
            amenities: state['amenities'],
            survivalGuide: state['survivalGuide'],
            socialMedia: state['socialMedia'],
            surfing: state['surfing'],
            hiking: state['hiking'],
            climbing: state['climbing'],
            mountainBiking: state['mountainBiking'],
            swimmingHoles: state['swimmingHoles'],
          );
        }
      },
    );
    return returnState;
  }

  static Future<List<States>> getStatesFromCountry(
    String country,
    List<String> returnColumns,
  ) async {
    List<States> returnStates = [];
    int parentId = await globals.getParentId(
        'Countries', 'countryId', 'countryName', country);
    await globals
        .getChildrenOfParent('States', returnColumns, 'countryId', parentId)
        .then((response) async {
      for (var state in response) {
        returnStates.add(
          States.createStateInstance(
            stateId: state['stateId'],
            countryId: state['countryId'],
            stateName: state['stateName'],
            briefDescription: state['briefDescription'],
            detailedDescription: state['detailedDescription'],
            history: state['history'],
            ethics: state['ethics'],
            camping: state['camping'],
            weather: state['weather'],
            facilities: state['facilities'],
            amenities: state['amenities'],
            survivalGuide: state['survivalGuide'],
            socialMedia: state['socialMedia'],
            surfing: state['surfing'],
            hiking: state['hiking'],
            climbing: state['climbing'],
            mountainBiking: state['mountainBiking'],
            swimmingHoles: state['swimmingHoles'],
          ),
        );
      }
    });
    return returnStates;
  }

  Future<void> addRegions(List<String> returnColumns) async {
    regions = await Region.getRegionsFromState(stateName, returnColumns);
  }
}