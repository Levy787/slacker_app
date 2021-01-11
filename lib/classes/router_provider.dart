import 'package:flutter/material.dart';
import 'package:slacker/root_widget.dart';
import 'package:slacker/screens/explore_screen.dart';
import 'package:slacker/screens/guide_screen.dart';

class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == ExploreScreen.id) {
      return generateExploreRoute(settings);
    } else if (settings.name == GuideScreen.id) {
      return generateGuideRoute(settings);
    } else if (settings.name == RootWidget.id) {
      return generateRootWidgetRoute(settings);
    } else {
      return null;
    }
  }

  static Route<dynamic> generateRootWidgetRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return RootWidget();
      },
    );
  }

  static Route<dynamic> generateExploreRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return ExploreScreen();
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
