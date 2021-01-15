import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../globals.dart';
import 'model_classes/state_class.dart';

class TabProvider with ChangeNotifier {
  TabItem homeTab = TabItem.explore;
  TabItem currentTab;

  bool feedOffstage;
  bool exploreOffstage;
  bool guideOffstage;
  bool mapOffstage;
  bool profileOffstage;

  States exploreStateCache;

  TabProvider(this.exploreStateCache) {
    currentTab = homeTab;
    feedOffstage = TabItem.feed != currentTab;
    exploreOffstage = TabItem.explore != currentTab;
    guideOffstage = TabItem.guide != currentTab;
    mapOffstage = TabItem.map != currentTab;
    profileOffstage = TabItem.profile != currentTab;
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
