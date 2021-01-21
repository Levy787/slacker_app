import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:slacker/globals.dart';
import 'package:slacker/models/states_class.dart';
import 'package:slacker/services/database/highline_database.dart';

class TabProvider with ChangeNotifier {
  TabItem homeTab = TabItem.explore;
  TabItem currentTab;

  bool feedOffstage;
  bool exploreOffstage;
  bool guideOffstage;
  bool mapOffstage;
  bool profileOffstage;

  States exploreStateCache;

  TabProvider() {
    print('Tab Provider init');
    init('Tasmania');
    currentTab = homeTab;
    feedOffstage = TabItem.feed != currentTab;
    exploreOffstage = TabItem.explore != currentTab;
    guideOffstage = TabItem.guide != currentTab;
    mapOffstage = TabItem.map != currentTab;
    profileOffstage = TabItem.profile != currentTab;
  }

  Future<void> init(String initialState) async {
    print('Getting State Cache');
    exploreStateCache =
        await HighlineDbProvider.getActiveStateCache(initialState);
    print('Got state Cache');
    notifyListeners();
  }

  void selectTab(TabItem tabItem) {
    if (tabItem == currentTab) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      currentTab == TabItem.feed ? feedOffstage = true : feedOffstage = false;
      currentTab == TabItem.explore
          ? exploreOffstage = true
          : exploreOffstage = false;
      currentTab == TabItem.guide
          ? guideOffstage = true
          : guideOffstage = false;
      currentTab == TabItem.map ? mapOffstage = true : mapOffstage = false;
      currentTab == TabItem.profile
          ? profileOffstage = true
          : profileOffstage = false;

      tabItem == TabItem.feed ? feedOffstage = false : feedOffstage = true;
      tabItem == TabItem.explore
          ? exploreOffstage = false
          : exploreOffstage = true;
      tabItem == TabItem.guide ? guideOffstage = false : guideOffstage = true;
      tabItem == TabItem.map ? mapOffstage = false : mapOffstage = true;
      tabItem == TabItem.profile
          ? profileOffstage = false
          : profileOffstage = true;

      currentTab = tabItem;
    }
    notifyListeners();
  }
}
