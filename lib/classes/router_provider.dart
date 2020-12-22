import 'package:flutter/material.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/screens/guide_select_screen.dart';
import 'package:slacker/screens/guide_screen.dart';
import 'package:slacker/screens/welcome_screen.dart';
import 'package:slacker/classes/highline_db_provider.dart';

class RouteProvider {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == LoadingScreen.id) {
      return generateLoadingRoute(settings);
    } else if (settings.name == GuideSelectScreen.id) {
      return generateGuideSelectRoute(settings);
    } else if (settings.name == GuideScreen.id) {
      return generateGuideRoute(settings);
    } else {
      return null;
    }
  }

  static Route<dynamic> generateLoadingRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return LoadingScreen();
      },
    );
  }

  static Route<dynamic> generateGuideSelectRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return GuideSelectScreen(
          db: arguments['HighlineDbProvider'],
          statesJSON: arguments['states'],
        );
      },
    );
  }

  static Route<dynamic> generateGuideRoute(RouteSettings settings) {
    final Map arguments = settings.arguments;
    return MaterialPageRoute(
      builder: (context) {
        return GuideScreen(
          guideName: arguments['guideName'],
        );
      },
    );
  }
}
