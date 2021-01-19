import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes/highline_db_provider.dart';
import 'package:slacker/root_widget.dart';
import 'classes/tab_provider_class.dart';
import 'screens/splash_screen.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'globals.dart';

//TODO: When doing query, do a join rather than looking up parentId

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
    return;
  }

  Future<void> initDatabase() async {
    await HighlineDbProvider.init();
    returnState = HighlineDbProvider.getActiveStateCache(activeState);
    return;
  }

  @override
  Widget build(BuildContext context) {
    print('Main widget build');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'PlayfairDisplay',
            letterSpacing: 0.7,
            wordSpacing: 0.5,
            height: 1.2,
            color: Colors.grey[900],
          ),
          headline4: TextStyle(
            fontFamily: 'PlayfairDisplay',
            letterSpacing: 0.7,
            wordSpacing: 0.5,
            height: 1.2,
            color: Colors.grey[900],
          ),
          headline5: TextStyle(
            fontFamily: 'PlayfairDisplay',
            letterSpacing: 0.7,
            wordSpacing: 0.5,
            height: 1.2,
            color: Colors.grey[900],
          ),
          headline6: TextStyle(
            fontFamily: 'PlayfairDisplay',
            letterSpacing: 0.7,
            wordSpacing: 0.5,
            height: 1.2,
            color: Colors.grey[900],
          ),
          subtitle1: TextStyle(
            fontFamily: 'Montserrat',
            letterSpacing: 0.3,
            wordSpacing: 0.5,
            height: 1.2,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Montserrat',
            letterSpacing: 0.3,
            wordSpacing: 0.5,
            height: 1.2,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            letterSpacing: 0.7,
            wordSpacing: 0.5,
            height: 1.2,
            color: Colors.black,
          ),
        ),
      ),
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
