import 'package:flutter/material.dart';
import 'services/providers/drawer_provider.dart';
import 'services/providers/tab_provider.dart';
import 'package:slacker/models/states_class.dart';
import 'widgets/drawer/guide_navigation_drawer.dart';
import 'widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'services/navigators/tab_navigator.dart';
import 'globals.dart';
import 'package:tuple/tuple.dart';

class RootWidget extends StatelessWidget {
  static const String id = 'root_widget';

  Future<bool> _onWillPop(
      TabItem currentTab, TabItem homeTab, Function selectHome) async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentTab].currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      // if not on the 'main' tab
      if (currentTab != homeTab) {
        // select 'main' tab
        selectHome(homeTab);
        // back button handled by app
        return false;
      }
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  AppBar _buildAppBar({TabItem currentTab, TextStyle headingStyle}) {
    return AppBar(
      automaticallyImplyLeading: (currentTab == TabItem.guide),
      title: Text(
        tabName[currentTab],
        style: headingStyle,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabProvider tabProvider = Provider.of<TabProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () => _onWillPop(
        tabProvider.currentTab,
        tabProvider.homeTab,
        tabProvider.selectTab,
      ),
      child: Scaffold(
        drawer: ChangeNotifierProvider<DrawerProvider>(
          create: (_) => DrawerProvider(),
          child: NavigationDrawer(),
        ),
        drawerEnableOpenDragGesture: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Selector<TabProvider, TabItem>(
            selector: (context, tabProvider) => tabProvider.currentTab,
            builder: (context, currentTab, __) => _buildAppBar(
              currentTab: currentTab,
              headingStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Selector<TabProvider, States>(
          selector: (_, currentState) => currentState.exploreStateCache,
          builder: (_, currentState, __) {
            if (currentState == null) {
              return Container(
                alignment: Alignment.topCenter,
                padding:
                    EdgeInsets.symmetric(vertical: 150.0, horizontal: 75.0),
                child: Image.asset('assets/images/logo_retro.png'),
              );
            } else {
              return Stack(children: <Widget>[
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
              ]);
            }
          },
        ),
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
