import 'package:flutter/material.dart';
import 'package:slacker/screens/guide_select_screen.dart';
import 'package:slacker/screens/loading_screen.dart';
import 'package:slacker/screens/welcome_screen.dart';
import 'package:slacker/screens/login_screen.dart';
import 'package:slacker/classes/router_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), //WelcomeScreen(),
      onGenerateRoute: RouteProvider.generateRoute,
    );
  }
}
