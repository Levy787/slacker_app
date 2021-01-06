import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/globals.dart' as globals;

class Country {
  int countryId;
  String countryName;
  List<States> states;

  Country({
    this.countryId,
    this.countryName,
    this.states,
  });

  static Country createCountryInstance({
    int countryId,
    String countryName,
    List<States> states,
  }) {
    return Country(
      countryId: countryId,
      countryName: countryName,
      states: states,
    );
  }

  static Future<Country> getCountry(
    String country,
    List<String> returnColumns,
  ) async {
    Country returnCountry;
    await globals.db.query(
      'Countries',
      columns: returnColumns,
      where: 'countryName = ?',
      whereArgs: [country],
    ).then((response) {
      for (var country in response) {
        returnCountry = Country.createCountryInstance(
          countryId: country['countryId'],
          countryName: country['countryName'],
        );
      }
    });
    return returnCountry;
  }

  Future<void> addStates(List<String> returnColumns) async {
    states = await States.getStatesFromCountry(countryName, returnColumns);
  }
}
