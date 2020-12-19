import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slacker/classes/state_line_info.dart';
import 'package:slacker/widgets/state_display_card.dart';
import 'package:slacker/widgets/custom_expansion_tile.dart';
import 'package:slacker/widgets/app_bars/sliver_image_app_bar.dart';
import 'package:slacker/widgets/app_bars/sliver_heading_app_bar.dart';

//TODO: maybe instead of dots have all state names and the selected underlined or dropdown

const double kIndexDotSize = 10.0;
const Color kIndexDotColor = Colors.black;

class StatePage extends StatefulWidget {
  final String stateName;
  final Map<String, Map<String, List<String>>> stateData;
  final int pageNumber;
  final int pageCount;

  StatePage({
    this.stateName,
    this.stateData,
    this.pageNumber,
    this.pageCount,
  });

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  int lineTypeDropdownIndex = 0;

  List<Widget> generatePageIndexDots(int pageNumber, int pageCount) {
    List<Widget> dots = [];

    for (var i = 1; i <= pageCount; i++) {
      dots.add(
        Icon(
          i == pageNumber ? Icons.brightness_1 : Icons.brightness_1_outlined,
          size: kIndexDotSize,
          color: kIndexDotColor,
        ),
      );
    }
    return dots;
  }

  String getStateImageDirectory(String stateName) {
    String baseDirectory = 'assets/images/states/';
    String imageName =
        '${stateName.toLowerCase().replaceAll(' ', '_')}_state.png';
    return '$baseDirectory$imageName';
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      cacheExtent: 2000, //TODO: Implement keep cache alive while in pageView
      slivers: [
        SliverImageAppBar(
          imageDirectory: getStateImageDirectory(widget.stateName),
        ),
        SliverHeadingAppBar(
          navigationDots:
              generatePageIndexDots(widget.pageNumber, widget.pageCount),
          stateName: widget.stateName,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (widget.stateData.length == 0) {
                return ListTile(
                  title: Text('Comming Soon!'),
                );
              } else {
                List<Widget> stateDetailList = generateRegionExpansionTiles(
                    widget.stateData, widget.stateName);
                return stateDetailList[index];
              }
            },
            childCount: widget.stateData.length == 0
                ? 1
                : generateRegionExpansionTiles(
                        widget.stateData, widget.stateName)
                    .length,
          ),
        ),
      ],
    );
  }
}

List<Widget> generateRegionExpansionTiles(
    Map<String, Map<String, List<String>>> stateData, String stateName) {
  List<Widget> returnList = [];
  stateData.forEach((region, value) {
    returnList.add(CustomExpansionTile(
      headerUnselected: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.5), color: Colors.grey),
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              region,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Color(0xff13525b),
              ),
            ),
            Icon(Icons.add, color: Color(0xff13525b)),
          ],
        ),
      ),
      headerSelected: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.5), color: Color(0xff13525b)),
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.5),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              region,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Icon(Icons.remove, color: Colors.white),
          ],
        ),
      ),
      children: generateAreaExpansionTiles(stateData[region]),
    ));
  });
  return returnList;
}

List<Widget> generateAreaExpansionTiles(Map<String, List<String>> regionData) {
  List<Widget> returnList = [];
  regionData.forEach((area, value) {
    returnList.add(CustomExpansionTile(
      headerUnselected: Text(area),
      headerSelected: Text(area),
      children: generateGuideCards(regionData[area]),
    ));
  });
  return returnList;
}

List<Widget> generateGuideCards(List<String> guideData) {
  List<Widget> returnList = [];
  guideData.forEach((guide) {
    returnList.add(ListGuide(guide));
  });
  return returnList;
}

class ListGuide extends StatelessWidget {
  final String guide;
  ListGuide(this.guide);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(guide);
      },
      child: Container(
        height: 60.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.white,
          child: Row(
            children: [
              Icon(
                Icons.landscape,
                size: 40.0,
              ),
              SizedBox(width: 20.0),
              Text(
                '$guide guide',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          elevation: 2.0,
        ),
      ),
    );
  }
}
