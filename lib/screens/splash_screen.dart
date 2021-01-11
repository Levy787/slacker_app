import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
