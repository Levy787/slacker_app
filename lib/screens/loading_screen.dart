import 'package:flutter/material.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:slacker/screens/guide_select_screen.dart';
import 'package:slacker/screens/state_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//TODO: bool for whether to init the database
//TODO: Come here when a query is run (dont init database and pass database object)
class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';

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
    initDatabase();
    super.initState();
  }

  Future<void> initDatabase() async {
    await db.init();
    Map<String, Map<String, Map<String, List<String>>>> statesJSON =
        await db.getGuideSelectJSON('Australia');
    Navigator.popAndPushNamed(
      context,
      GuideSelectScreen.id, //GuideSelectScreen.id,
      arguments: {'HighlineDbProvider': db, 'states': statesJSON},
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
