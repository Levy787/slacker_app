import 'package:flutter/material.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/globals.dart' as globals;
import 'explore_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ///Seems like a really hacky way to get get to the explore page
  ///Review later

  @override
  void initState() {
    //Initialise the database them get the explore data which will then push
    //to the explore page. Done this way to keep it all in initState
    HighlineDbProvider().init().then((_) => getExplore('Tasmania'));
    super.initState();
  }

  Future<void> getExplore(String stateName) async {
    States state = await States.getState(stateName);
    state.addRegions(['regionName', 'briefDescription']);
    //await Future.delayed(const Duration(seconds: 5));
    Navigator.pushNamed(
      context,
      ExploreScreen.id,
      arguments: {'state': state},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 75.0),
        child: Image.asset('assets/images/logo_retro.png'),
      ),
    );
  }
}
