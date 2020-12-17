import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slacker/classes/state_line_info.dart';

class StateDisplayCard extends StatelessWidget {
  final String imageDirectory;
  final StateLineInfo stateLineInfo;

  StateDisplayCard({
    this.imageDirectory,
    this.stateLineInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.transparent,
      child: Image.asset(imageDirectory),
    );
  }
}
