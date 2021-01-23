import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:slacker/globals.dart';
import 'package:slacker/models/states_class.dart';
import 'package:slacker/services/database/highline_database.dart';

class StateProvider with ChangeNotifier {
  TabItem homeTab = TabItem.explore;
  TabItem currentTab;

  bool feedOffstage;
  bool exploreOffstage;
  bool guideOffstage;
  bool mapOffstage;
  bool profileOffstage;

  States activeStateData;

  StateProvider() {
    setStates('Tasmania');
    currentTab = homeTab;
    feedOffstage = TabItem.feed != currentTab;
    exploreOffstage = TabItem.explore != currentTab;
    guideOffstage = TabItem.guide != currentTab;
    mapOffstage = TabItem.map != currentTab;
    profileOffstage = TabItem.profile != currentTab;
  }

  Future<void> setStates(String stateName) async {
    activeStateData = await HighlineDbProvider.getActiveStateCache(stateName);
    notifyListeners();
  }

  void selectTab(TabItem tabItem) {
    if (tabItem == currentTab) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      currentTab = tabItem;
      feedOffstage = (currentTab != TabItem.feed);
      exploreOffstage = (currentTab != TabItem.explore);
      guideOffstage = (currentTab != TabItem.guide);
      mapOffstage = (currentTab != TabItem.map);
      profileOffstage = (currentTab != TabItem.profile);
    }
    notifyListeners();
  }
}
