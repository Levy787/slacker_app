import 'package:flutter/material.dart';

//TODO: Create a custom dropdown so it fits better

const Color kStateNameColor = Colors.black;
const Color kAppBarBackgroundColor = Color(0xBBE0E0E0);
const double kHeight = 120.0;
const double kTopRadius = 10.0;

class SliverHeadingAppBar extends StatefulWidget {
  final List<Widget> navigationDots;
  final String stateName;

  SliverHeadingAppBar({this.navigationDots, this.stateName});
  @override
  _SliverHeadingAppBarState createState() => _SliverHeadingAppBarState();
}

class _SliverHeadingAppBarState extends State<SliverHeadingAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kAppBarBackgroundColor,
      expandedHeight: kHeight,
      collapsedHeight: kHeight,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(kTopRadius),
          topLeft: Radius.circular(kTopRadius),
        ),
      ),
      flexibleSpace: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: 7.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.navigationDots,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: FittedBox(
                  child: Text(
                    widget.stateName,
                    style: TextStyle(
                      color: kStateNameColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Line Type:',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 10.0),
                DropdownButton(
                  underline: SizedBox(
                    height: 0.0,
                  ),
                  value: 0,
                  items: [
                    DropdownMenuItem(child: Text('All'), value: 0),
                    DropdownMenuItem(child: Text('Highline'), value: 1),
                    DropdownMenuItem(child: Text('Midline'), value: 2),
                    DropdownMenuItem(child: Text('Waterline'), value: 3),
                    DropdownMenuItem(child: Text('Parkline'), value: 4),
                  ],
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
