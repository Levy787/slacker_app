library my_prj.globals;

import 'package:sqflite/sqflite.dart';

import 'classes/model_classes/country_class.dart';

Database db; //Main database for Slacker

///Database Functions
Future<Country> getGuideSelectData(String countryName) async {
  Country country = await Country.getCountry(countryName, ['countryName']);
  await country.addStates(['stateName']);
  for (var state in country.states) {
    await state.addRegions(['regionName']);
    for (var region in state.regions) {
      await region.addAreas(['areaName']);
      for (var area in region.areas) {
        await area.addGuides(['guideName']);
      }
    }
  }
  return country;
}

Future<int> getParentId(
    String parentTableName, String columnMatch, String nameMatch) async {
  int parentId;
  await db
      .query(
    parentTableName,
    columns: ['id'],
    where: '$columnMatch = ?',
    whereArgs: [nameMatch],
  )
      .then((response) {
    parentId = response[0]['id'];
  });
  return parentId;
}

Future<dynamic> getChildrenOfParent(
    String childTable, List<String> returnColumns, int parentId) async {
  List<dynamic> children = [];
  await db.query(
    childTable,
    columns: returnColumns,
    where: 'parentId = ?',
    whereArgs: [parentId],
  ).then(
    (response) => response.forEach(
      (child) {
        children.add(
          child,
        );
      },
    ),
  );
  return children;
}
