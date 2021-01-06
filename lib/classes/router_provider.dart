import 'package:flutter/material.dart';
import 'package:slacker/screens/explore_screen.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/screens/guide_select_screen.dart';
import 'package:slacker/screens/guide_screen.dart';
import 'file:///C:/Users/levi_/Desktop/Flutter_Projects/slacker/lib/depreciated/welcome_screen.dart';
import 'package:slacker/classes/highline_db_provider.dart';

class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == LoadingScreen.id) {
      return generateLoadingRoute(settings);
    } else if (settings.name == ExploreScreen.id) {
      return generateExploreRoute(settings);
    } else if (settings.name == GuideScreen.id) {
      return generateGuideRoute(settings);
    } else {
      return null;
    }
  }

  static Route<dynamic> generateLoadingRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return LoadingScreen(
          route: arguments['route'],
          nextArguments: arguments['arguments'],
        );
      },
    );
  }

  static Route<dynamic> generateExploreRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return ExploreScreen(
          state: arguments['state'],
        );
      },
    );
  }

  static Route<dynamic> generateGuideRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return GuideScreen(
          guide: arguments['guide'],
        );
      },
    );
  }
}
