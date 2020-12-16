import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slacker/classes/state_line_info.dart';
import 'dart:ui';

const kCardFontSize = 16.0;
const kCardColor = Color(0x229E9E9E);
const kImageBackgroundColor = Color(0x009E9E9E);
const kCardInformationBackgroundColor = Color(0x009E9E9E);

class StateDisplayCard extends StatelessWidget {
  final String imageDirectory;
  final StateLineInfo stateLineInfo;

  StateDisplayCard({
    this.imageDirectory,
    this.stateLineInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: kImageBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageDirectory,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: kCardInformationBackgroundColor,
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number of lines: ${stateLineInfo.numberOfLines}',
                    style: TextStyle(fontSize: kCardFontSize),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Avg stars: ${stateLineInfo.averageStars}',
                    style: TextStyle(fontSize: kCardFontSize),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Avg line length: ${stateLineInfo.averageLineLength}m',
                    style: TextStyle(fontSize: kCardFontSize),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
