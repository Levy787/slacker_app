import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slacker/widgets/pill_dropdown.dart';
import 'package:slacker/widgets/state_display_card.dart';

List genderOptions = ['Male', 'Female'];

class StatePage extends StatefulWidget {
  final List<String> stateDetails;
  final int pageNumber;
  final int pageCount;

  StatePage({this.stateDetails, this.pageNumber, this.pageCount});

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  int highlineDropdownIndex = 0;
  int regionDropdownIndex = 0;
  int areaDropdownIndex = 0;

  List<Widget> generatePageIndexDots(int pageNumber, int pageCount) {
    List<Widget> returnList = [];
    for (var i = 1; i <= pageCount; i++) {
      if (i == pageNumber) {
        returnList.add(
          Icon(
            Icons.brightness_1,
            size: 10,
          ),
        );
      } else {
        returnList.add(
          Icon(
            Icons.brightness_1_outlined,
            size: 10,
          ),
        );
      }
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: StateDisplayCard(),
            ),
            expandedHeight: 250,
            collapsedHeight: 250,
            backgroundColor: Colors.transparent,
            pinned: false),
        SliverAppBar(
          flexibleSpace: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generatePageIndexDots(
                      widget.pageNumber, widget.pageCount),
                ),
                Text(
                  'Tasmania',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [CustomDropdown(text: 'hi')],
                )
              ],
            ),
          ),
          expandedHeight: 120,
          collapsedHeight: 120,
          backgroundColor: Colors.grey[800],
          elevation: 0,
          pinned: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
            childCount: widget.stateDetails.length,
          ),
        ),
      ],
    );
  }
}
