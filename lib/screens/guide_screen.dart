import 'package:flutter/material.dart';

class GuideScreen extends StatelessWidget {
  static const String id = 'guide_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Guide Screen',
        style: TextStyle(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
