import 'package:flutter/material.dart';
import 'classes/bottom_navigation.dart';
import 'classes/model_classes/state_class.dart';
import 'classes/tab_navigator.dart';
import 'globals.dart';

class RootWidget extends StatefulWidget {
  static const String id = 'root_widget';
  final States state;
  RootWidget({this.state});

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  //Always Loads this tab when app is opened
  TabItem _currentTab = TabItem.explore;

  final _navigatorKeys = {
    TabItem.feed: GlobalKey<NavigatorState>(),
    TabItem.explore: GlobalKey<NavigatorState>(),
    TabItem.guide: GlobalKey<NavigatorState>(),
    TabItem.map: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route of tab if selected tab is pressed
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //TODO: onWillPop isn't working
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.explore) {
            // select 'main' tab
            _selectTab(TabItem.explore);
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
          title: Text(tabName[_currentTab],
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w700)),
          //elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.feed),
          Offstage(
            offstage: _currentTab != TabItem.explore,
            child: ExploreNavigator(
                navigatorKey: _navigatorKeys[TabItem.explore],
                state: widget.state),
          ),
          _buildOffstageNavigator(TabItem.guide),
          _buildOffstageNavigator(TabItem.map),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
