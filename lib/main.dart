import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:slacker/classes/router_provider.dart';
import 'package:slacker/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontFamily: 'Montserrat',
              height: 1.2,
              fontSize: 15.0,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          headline3: TextStyle(
            fontFamily: 'PlayfairDisplay',
            height: 1.25,
            fontSize: 45.0,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontFamily: 'PlayfairDisplay',
            height: 1.25,
            fontSize: 34.0,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontFamily: 'PlayfairDisplay',
            height: 1.25,
            fontSize: 24.0,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontFamily: 'PlayfairDisplay',
            height: 1.25,
            fontSize: 20.0,
          ),
        ),
      ),
      home: WelcomeScreen(),
      onGenerateRoute: RouteProvider.generateRoute,
    );
  }
}
