library my_prj.globals;

import 'package:sqflite/sqflite.dart';

import 'classes/model_classes/country_class.dart';
import 'classes/model_classes/guide_class.dart';
import 'classes/model_classes/state_class.dart';

Database db; //Main database for Slacker

///Database Functions
Future<Country> getGuideSelectData(String countryName) async {
  Country country = await Country.getCountry(countryName, ['CountryName']);
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

Future<States> getExploreData(String stateName) async {
  States state = await States.getState(stateName);
  return state;
}

Future<Guide> getGuideData(String guideName) async {
  Guide guide = await Guide.getGuide(guideName);
  await guide.addGuideAreas();
  for (var guideArea in guide.guideAreas) {
    await guideArea.addHighlines();
    //await guideArea.addMidlines();
    //await guideArea.addWaterlines();
    //await guideArea.addParklines();
  }
  return guide;
}

Future<int> getParentId(String parentTableName, String returnColumn,
    String columnMatch, String nameMatch) async {
  int parentId;
  await db
      .query(
    parentTableName,
    columns: [returnColumn],
    where: '$columnMatch = ?',
    whereArgs: [nameMatch],
  )
      .then((response) {
    parentId = response[0][returnColumn];
  });
  return parentId;
}

Future<dynamic> getChildrenOfParent(String childTable,
    List<String> returnColumns, String parentIdColumnName, int parentId) async {
  List<dynamic> children = [];
  await db.query(
    childTable,
    columns: returnColumns,
    where: '$parentIdColumnName = ?',
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
