import 'package:flutter/material.dart';
import 'package:slacker/depreciated/welcome_screen.dart';
import 'package:slacker/globals.dart';
import 'package:slacker/screens/explore_screen.dart';
import 'package:slacker/globals.dart' as globals;

import 'package:slacker/classes/model_classes/state_class.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _pushToExploreFromWelcome(BuildContext context, State state) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => routeBuilders[ExploreScreen.id](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {States state}) {
    return {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      ExploreScreen.id: (context) => ExploreScreen(state: state)
      /*TabNavigatorRoutes.root: (context) => ColorsListPage(
        color: activeTabColor[tabItem],
        title: tabName[tabItem],
        onPush: (materialIndex) =>
            _push(context, materialIndex: materialIndex),
      ),*/
      /*TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: TabHelper.color(tabItem),
            title: TabHelper.description(tabItem),
            materialIndex: materialIndex,
          ),*/
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: WelcomeScreen.id,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}

class ExploreNavigator extends StatelessWidget {
  ExploreNavigator({this.navigatorKey, this.state});
  final GlobalKey<NavigatorState> navigatorKey;
  final States state;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {States state}) {
    return {ExploreScreen.id: (context) => ExploreScreen(state: state)};
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context, state: state);

    return Navigator(
      key: navigatorKey,
      initialRoute: ExploreScreen.id,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context));
      },
    );
  }
}
