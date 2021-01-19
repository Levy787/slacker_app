import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slacker/classes/drawer_provider.dart';
import 'package:slacker/classes/tab_provider_class.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/screens/navigation_drawer.dart';
import 'classes/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'classes/tab_navigator.dart';
import 'globals.dart';
import 'package:tuple/tuple.dart';

class RootWidget extends StatelessWidget {
  static const String id = 'root_widget';
  Future<void> initProvider(TabProvider tabProvider) async {
    await States.getState(activeState)
        .then((state) => tabProvider.exploreStateCache = state);
  }

  AppBar feedAppBar({BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Feed',
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  AppBar exploreAppBar({BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Explore',
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  AppBar guideAppBar({BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(
        'Guide',
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  AppBar mapAppBar({BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Map',
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  AppBar profileAppBar({BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'Profile',
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Root widget built');
    TabProvider tabProvider = Provider.of<TabProvider>(context, listen: false);
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
        drawer: ChangeNotifierProvider<DrawerProvider>(
          create: (_) => DrawerProvider(),
          child: NavigationDrawer(),
        ),
        drawerEnableOpenDragGesture: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Selector<TabProvider, TabItem>(
            selector: (context, tp) => tp.currentTab,
            builder: (_, currentTab, __) {
              if (currentTab == TabItem.feed) {
                return feedAppBar(context: context);
              } else if (currentTab == TabItem.explore) {
                return exploreAppBar(context: context);
              } else if (currentTab == TabItem.guide) {
                return guideAppBar(context: context);
              } else if (currentTab == TabItem.map) {
                return mapAppBar(context: context);
              } else if (currentTab == TabItem.profile) {
                return profileAppBar(context: context);
              } else {
                throw ('Cannot find TabItem to get appBar');
              }
            },
          ),
        ),
        body: Stack(children: <Widget>[
          Selector<TabProvider, bool>(
            selector: (_, tp) => tp.feedOffstage,
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
