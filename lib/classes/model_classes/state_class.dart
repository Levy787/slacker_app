import 'package:slacker/classes/model_classes/region_class.dart';
import 'package:slacker/globals.dart' as globals;

class States {
  int stateId;
  int parentId;
  String stateName;
  String briefDescription;
  List<Region> regions;

  States({
    this.stateId,
    this.parentId,
    this.stateName,
    this.briefDescription,
    this.regions,
  });

  static States createStateInstance({
    int stateId,
    int parentId,
    String stateName,
    String briefDescription,
    List<Region> regions,
  }) {
    return States(
      stateId: stateId,
      parentId: parentId,
      stateName: stateName,
      briefDescription: briefDescription,
      regions: regions,
    );
  }

  static Future<List<States>> getStatesFromCountry(
    String country,
    List<String> returnColumns,
  ) async {
    List<States> returnStates = [];
    int parentId =
        await globals.getParentId('Countries', 'countryName', country);
    await globals
        .getChildrenOfParent('States', returnColumns, parentId)
        .then((response) async {
      for (var state in response) {
        returnStates.add(
          States.createStateInstance(
            stateName: state['stateName'],
            stateId: state['id'],
            briefDescription: state['briefDescription'],
            parentId: state['parentId'],
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
