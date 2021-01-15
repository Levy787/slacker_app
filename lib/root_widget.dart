import 'package:flutter/material.dart';
import 'package:slacker/classes/tab_provider_class.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'classes/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'classes/tab_navigator.dart';
import 'globals.dart';
import 'package:tuple/tuple.dart';

///Mayabe lift the future builder up from the explore screen, bring it into the
///Tab provider. Once we load the data initially cache it. If we then change it, it will
///query the database then notify the listerens with the new data.
///
/// Have the current state selected in the provider, when that state is changed then we can update
/// the explore page!!

class RootWidget extends StatelessWidget {
  static const String id = 'root_widget';
  Future<void> initProvider(TabProvider tabProvider) async {
    await States.getState(activeState)
        .then((state) => tabProvider.exploreStateCache = state);
  }

  @override
  Widget build(BuildContext context) {
    print('Root widget built');
    TabProvider tabProvider = Provider.of<TabProvider>(context, listen: false);
    /*return FutureBuilder(
      future: initProvider(tabProvider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return WillPopScope(
            onWillPop: () async {
              print('Running onWillPop');
              print(tabProvider.currentTab);
              final isFirstRouteInCurrentTab =
                  !await navigatorKeys[tabProvider.currentTab]
                      .currentState
                      .maybePop();
              if (isFirstRouteInCurrentTab) {
                // if not on the 'main' tab
                if (tabProvider.currentTab != tabProvider.homeTab) {
                  // select 'main' tab
                  tabProvider.selectTab(tabProvider.homeTab);
                  // back button handled by app
                  return false;
                }
              }
              // let system handle back button if we're on the first route
              return isFirstRouteInCurrentTab;
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(tabName[tabProvider.currentTab],
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700)),
                backgroundColor: Colors.white,
                centerTitle: true,
              ),
              body: Stack(children: <Widget>[
                Selector<TabProvider, bool>(
                  selector: (_, feedData) => feedData.feedOffstage,
                  builder: (_, feedOffstage, __) {
                    return Offstage(
                      offstage: feedOffstage,
                      child: TabNavigator(
                        navigatorKey: navigatorKeys[TabItem.feed],
                        tabItem: TabItem.feed,
                      ),
                    );
                  },
                ),
                Selector<TabProvider, Tuple2<bool, States>>(
                  selector: (_, exploreData) => Tuple2(
                      exploreData.exploreOffstage,
                      exploreData.exploreStateCache),
                  builder: (_, exploreOffstage, __) {
                    return Offstage(
                      offstage: exploreOffstage.item1,
                      child: ExploreNavigator(
                          navigatorKey: navigatorKeys[TabItem.explore]),
                    );
                  },
                ),
                Selector<TabProvider, bool>(
                  selector: (_, guideData) => guideData.guideOffstage,
                  builder: (_, guideOffstage, __) {
                    return Offstage(
                      offstage: guideOffstage,
                      child: GuideNavigator(
                        navigatorKey: navigatorKeys[TabItem.guide],
                      ),
                    );
                  },
                ),
                Selector<TabProvider, bool>(
                  selector: (_, mapData) => mapData.mapOffstage,
                  builder: (_, mapOffstage, __) {
                    return Offstage(
                      offstage: mapOffstage,
                      child: TabNavigator(
                        navigatorKey: navigatorKeys[TabItem.map],
                        tabItem: TabItem.map,
                      ),
                    );
                  },
                ),
                Selector<TabProvider, bool>(
                  selector: (_, profileData) => profileData.profileOffstage,
                  builder: (_, profileOffstage, __) {
                    return Offstage(
                      offstage: profileOffstage,
                      child: TabNavigator(
                        navigatorKey: navigatorKeys[TabItem.profile],
                        tabItem: TabItem.profile,
                      ),
                    );
                  },
                ),
              ]),
              bottomNavigationBar: Selector<TabProvider, TabItem>(
                selector: (_, tab) => tab.currentTab,
                builder: (_, currentTab, __) {
                  return BottomNavigation(
                    currentTab: currentTab,
                    onSelectTab: tabProvider.selectTab,
                  );
                },
              ),
            ),
          );
        } else {
          throw ('Error getting root widget Future');
        }
      },
    );*/
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[tabProvider.currentTab]
                .currentState
                .maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (tabProvider.currentTab != tabProvider.homeTab) {
            // select 'main' tab
            tabProvider.selectTab(tabProvider.homeTab);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(tabName[tabProvider.currentTab],
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
          Selector<TabProvider, bool>(
            selector: (_, feedData) => feedData.feedOffstage,
            builder: (_, feedOffstage, __) {
              return Offstage(
                offstage: feedOffstage,
                child: TabNavigator(
                  navigatorKey: navigatorKeys[TabItem.feed],
                  tabItem: TabItem.feed,
                ),
              );
            },
          ),
          Selector<TabProvider, Tuple2<bool, States>>(
            selector: (_, exploreData) => Tuple2(
                exploreData.exploreOffstage, exploreData.exploreStateCache),
            builder: (_, exploreOffstage, __) {
              return Offstage(
                offstage: exploreOffstage.item1,
                child: ExploreNavigator(
                    navigatorKey: navigatorKeys[TabItem.explore]),
              );
            },
          ),
          Selector<TabProvider, bool>(
            selector: (_, guideData) => guideData.guideOffstage,
            builder: (_, guideOffstage, __) {
              return Offstage(
                offstage: guideOffstage,
                child: GuideNavigator(
                  navigatorKey: navigatorKeys[TabItem.guide],
                ),
              );
            },
          ),
          Selector<TabProvider, bool>(
            selector: (_, mapData) => mapData.mapOffstage,
            builder: (_, mapOffstage, __) {
              return Offstage(
                offstage: mapOffstage,
                child: TabNavigator(
                  navigatorKey: navigatorKeys[TabItem.map],
                  tabItem: TabItem.map,
                ),
              );
            },
          ),
          Selector<TabProvider, bool>(
            selector: (_, profileData) => profileData.profileOffstage,
            builder: (_, profileOffstage, __) {
              return Offstage(
                offstage: profileOffstage,
                child: TabNavigator(
                  navigatorKey: navigatorKeys[TabItem.profile],
                  tabItem: TabItem.profile,
                ),
              );
            },
          ),
        ]),
        bottomNavigationBar: Selector<TabProvider, TabItem>(
          selector: (_, tab) => tab.currentTab,
          builder: (_, currentTab, __) {
            return BottomNavigation(
              currentTab: currentTab,
              onSelectTab: tabProvider.selectTab,
            );
          },
        ),
      ),
    );
  }
}
