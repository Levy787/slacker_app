import 'package:flutter/material.dart';

const kBottomSheetRadius = 10.0;
const kFormThemeColor = Color(0XFF1779B1);
const kFormTextInputHeadingColor = Color(0xFF424242);

InputDecoration kAppBarSearchBarDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Search',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);

const kBottomSheetDecotarion = BoxDecoration(
  color: const Color(0xFFFFFFFF), //Color(0xFFE0E0E0),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kBottomSheetRadius),
    topRight: Radius.circular(kBottomSheetRadius),
  ),
);

final kModalSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(kBottomSheetRadius),
);

const kStateStyle = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontSize: 34.0,
  fontWeight: FontWeight.w500,
);
const kRegionStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 26.0,
  fontWeight: FontWeight.w400,
);
const kAreaStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
);
const kGuideStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
);
const kGuideSectionStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18.0,
  fontWeight: FontWeight.w400,
);
const kBodyStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
);
