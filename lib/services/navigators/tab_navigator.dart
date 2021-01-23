import 'package:flutter/material.dart';
import 'package:slacker/screens/explore/explore_general_information_screen.dart';
import 'package:slacker/screens/explore/explore_screen.dart';
import 'package:slacker/screens/feed/feed_screen.dart';
import 'package:slacker/screens/guide/guide_screen.dart';
import 'package:slacker/screens/map/map_screen.dart';
import 'package:slacker/screens/profile/profile_screen.dart';

class FeedNavigator extends StatelessWidget {
  FeedNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == FeedScreen.id) {
      return generateGuideRoute(settings);
    } else {
      throw ('Navigation page cannot be found');
    }
  }

  Route<dynamic> generateGuideRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return FeedScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: FeedScreen.id,
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

class MapNavigator extends StatelessWidget {
  MapNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == MapScreen.id) {
      return generateGuideRoute(settings);
    } else {
      throw ('Navigation page cannot be found');
    }
  }

  Route<dynamic> generateGuideRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return MapScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: MapScreen.id,
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }
}

class ProfileNavigator extends StatelessWidget {
  ProfileNavigator({this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == ProfileScreen.id) {
      return generateGuideRoute(settings);
    } else {
      throw ('Navigation page cannot be found');
    }
  }

  Route<dynamic> generateGuideRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return ProfileScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: ProfileScreen.id,
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
    );
  }
}
