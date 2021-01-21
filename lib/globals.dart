library my_prj.globals;

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'models/country_class.dart';
import 'models/guide_class.dart';
import 'models/states_class.dart';

String activeState = 'Tasmania';

//TODO: get rid of globals!!

///Cache data
Future<States> exploreData = getExploreData('Tasmania');

///Bottom Navigation Code
enum TabItem { feed, explore, guide, map, profile }

const Map<TabItem, String> tabName = {
  TabItem.feed: 'Feed',
  TabItem.explore: 'Explore',
  TabItem.guide: 'Guide',
  TabItem.map: 'Map',
  TabItem.profile: 'Profile',
};

final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
  TabItem.feed: GlobalKey<NavigatorState>(),
  TabItem.explore: GlobalKey<NavigatorState>(),
  TabItem.guide: GlobalKey<NavigatorState>(),
  TabItem.map: GlobalKey<NavigatorState>(),
  TabItem.profile: GlobalKey<NavigatorState>(),
};

///Database Functions

Database db;

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

Future<List<Map<String, dynamic>>> getChildrenOfParent(String childTable,
    List<String> returnColumns, String parentIdColumnName, int parentId) async {
  List<Map<String, dynamic>> children = [];
  await db.query(
    childTable,
    columns: returnColumns,
    where: '$parentIdColumnName = ?',
    whereArgs: [parentId],
  ).then(
    (response) => response.forEach(
      (child) {
        children.add(child);
      },
    ),
  );
  //Casts mutable from 'Queryset'
  children = List<Map<String, dynamic>>.generate(
      children.length, (index) => Map<String, dynamic>.from(children[index]),
      growable: true);

  //Removes 'NULL' values from each row
  children.forEach((element) {
    element.removeWhere((key, value) => value == "NULL");
  });
  return children;
}
