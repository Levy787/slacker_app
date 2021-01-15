import 'package:flutter/material.dart';
import 'package:slacker/globals.dart';
import 'package:slacker/screens/explore_general_information_screen.dart';
import 'package:slacker/screens/explore_screen.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/screens/guide_screen.dart';
import 'package:slacker/screens/splash_screen.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {States state}) {
    return {
      SplashScreen.id: (context) => SplashScreen(),
      ExploreScreen.id: (context) => ExploreScreen()
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: SplashScreen.id,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}

class GuideNavigator extends StatelessWidget {
  GuideNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == GuideScreen.id) {
      return generateGuideRoute(settings);
    } else {
      throw ('Navigation page cannot be found');
    }
  }

  Route<dynamic> generateGuideRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return GuideScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: GuideScreen.id,
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }
}

class ExploreNavigator extends StatelessWidget {
  ExploreNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == ExploreScreen.id) {
      return generateExploreRoute(settings);
    } else if (settings.name == ExploreGeneralInformationScreen.id) {
      return generateExploreGeneralInformationRoute(settings);
    } else {
      throw ('Navigation page cannot be found');
    }
  }

  Route<dynamic> generateExploreRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return ExploreScreen();
      },
    );
  }

  Route<dynamic> generateExploreGeneralInformationRoute(
      RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return ExploreGeneralInformationScreen(
          displayHtml: arguments['displayHtml'],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: ExploreScreen.id,
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }
}
