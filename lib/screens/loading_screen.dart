import 'package:flutter/material.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slacker/classes/model_classes/country_class.dart';
import 'package:slacker/classes/model_classes/guide_class.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/screens/guide_screen.dart';
import 'package:slacker/screens/guide_select_screen.dart';
import 'package:slacker/globals.dart' as globals;

import 'explore_screen.dart';

//TODO: bool for whether to init the database
//TODO: Come here when a query is run (dont init database and pass database object)
class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';
  final String route;
  final Map<String, dynamic> nextArguments;

  LoadingScreen({
    @required this.route,
    this.nextArguments,
  });

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final HighlineDbProvider db = HighlineDbProvider();

  final spinkit = SpinKitFadingCircle(
    size: 100.0,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Color(0XFF1779B1) : Color(0xFFb15217),
          shape: BoxShape.circle,
        ),
      );
    },
  );

  @override
  void initState() {
    routerLoadingFunction();
    super.initState();
  }

  void routerLoadingFunction() async {
    await db.init();
    if (widget.route == GuideSelectScreen.id) {
      initDatabase();
    } else if (widget.route == ExploreScreen.id) {
      getExplore();
    } else if (widget.route == GuideScreen.id) {
      getGuide();
    }
  }

  Future<void> initDatabase() async {
    Country country = await globals.getGuideSelectData('Australia');
    Navigator.popAndPushNamed(
      context,
      GuideSelectScreen.id,
      arguments: {'country': country},
    );
  }

  Future<void> getExplore() async {
    States state = await globals.getExploreData(widget.nextArguments['state']);
    Navigator.pushNamed(
      context,
      ExploreScreen.id,
      arguments: {'state': state},
    );
  }

  Future<void> getGuide() async {
    Guide guide = await globals.getGuideData(widget.nextArguments['guideName']);
    Navigator.pushNamed(
      context,
      GuideScreen.id,
      arguments: {'guide': guide},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
