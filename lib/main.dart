import 'package:flutter/material.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/screens/welcome_screen.dart';
import 'package:slacker/classes/router_provider.dart';
import 'package:slacker/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      onGenerateRoute: RouteProvider.generateRoute,
    );
  }
}
