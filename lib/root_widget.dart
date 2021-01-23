import 'package:flutter/material.dart';
import 'services/providers/drawer_provider.dart';
import 'services/providers/state_provider.dart';
import 'package:slacker/models/states_class.dart';
import 'widgets/drawer/guide_navigation_drawer.dart';
import 'widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'services/navigators/tab_navigator.dart';
import 'globals.dart';
import 'package:tuple/tuple.dart';

class RootWidget extends StatelessWidget {
  static const String id = 'root_widget';

  //TODO: _onWillPop should pop drawer
  Future<bool> _onWillPop({
    TabItem currentTab,
    TabItem homeTab,
    Function selectTab,
  }) async {
    final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentTab].currentState.maybePop();
    if (isFirstRouteInCurrentTab) {
      // if not on the 'main' tab
      if (currentTab != homeTab) {
        // select 'main' tab
        selectTab(homeTab);
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
    print('Root widget build');
    StateProvider tabProvider =
        Provider.of<StateProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () => _onWillPop(
        currentTab: tabProvider.currentTab,
        homeTab: tabProvider.homeTab,
        selectTab: tabProvider.selectTab,
      ),
      child: Scaffold(
        drawer: ChangeNotifierProvider<DrawerProvider>(
          create: (_) => DrawerProvider(tabProvider.activeStateData),
          child: NavigationDrawer(),
        ),
        drawerEnableOpenDragGesture: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Selector<StateProvider, TabItem>(
            selector: (_, tabProvider) => tabProvider.currentTab,
            builder: (context, currentTab, __) => _buildAppBar(
              currentTab: currentTab,
              headingStyle: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Selector<StateProvider, States>(
          selector: (_, tabProvider) => tabProvider.activeStateData,
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
                Selector<StateProvider, bool>(
                  selector: (_, tabProvider) => tabProvider.feedOffstage,
                  builder: (_, feedOffstage, __) {
                    return Offstage(
                      offstage: feedOffstage,
                      child: FeedNavigator(
                        navigatorKey: navigatorKeys[TabItem.feed],
                      ),
                    );
                  },
                ),
                Selector<StateProvider, Tuple2<bool, States>>(
                  selector: (_, tabProvider) => Tuple2(
                      tabProvider.exploreOffstage, tabProvider.activeStateData),
                  builder: (_, exploreOffstage, __) {
                    return Offstage(
                      offstage: exploreOffstage.item1,
                      child: ExploreNavigator(
                          navigatorKey: navigatorKeys[TabItem.explore]),
                    );
                  },
                ),
                Selector<StateProvider, bool>(
                  selector: (_, tabProvider) => tabProvider.guideOffstage,
                  builder: (_, guideOffstage, __) {
                    return Offstage(
                      offstage: guideOffstage,
                      child: GuideNavigator(
                        navigatorKey: navigatorKeys[TabItem.guide],
                      ),
                    );
                  },
                ),
                Selector<StateProvider, bool>(
                  selector: (_, tabProvider) => tabProvider.mapOffstage,
                  builder: (_, mapOffstage, __) {
                    return Offstage(
                      offstage: mapOffstage,
                      child: MapNavigator(
                        navigatorKey: navigatorKeys[TabItem.map],
                      ),
                    );
                  },
                ),
                Selector<StateProvider, bool>(
                  selector: (_, tabProvider) => tabProvider.profileOffstage,
                  builder: (_, profileOffstage, __) {
                    return Offstage(
                      offstage: profileOffstage,
                      child: ProfileNavigator(
                        navigatorKey: navigatorKeys[TabItem.profile],
                      ),
                    );
                  },
                ),
              ]);
            }
          },
        ),
        bottomNavigationBar: Selector<StateProvider, TabItem>(
          selector: (_, tabProvider) => tabProvider.currentTab,
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
