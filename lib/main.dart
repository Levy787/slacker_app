import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes/highline_db_provider.dart';
import 'package:slacker/root_widget.dart';
import 'classes/tab_provider_class.dart';
import 'screens/splash_screen.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'globals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<States> returnState;

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  Future<void> initDatabase() async {
    await HighlineDbProvider.init();
    returnState = HighlineDbProvider.getActiveStateCache(activeState);
  }

  @override
  Widget build(BuildContext context) {
    print('Main widget build');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: returnState,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider<TabProvider>(
              create: (_) => TabProvider(snapshot.data),
              child: RootWidget(),
            );
          } else if (snapshot.hasError) {
            throw ('Material app snapshot has an error');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (snapshot.connectionState == ConnectionState.active) {
            return SplashScreen();
          } else if (snapshot.connectionState == ConnectionState.none) {
            return SplashScreen();
          } else {
            throw ('Material App Future Builder Connection State not \'waiting\' or \'done\'');
          }
        },
      ),
    );
  }
}
