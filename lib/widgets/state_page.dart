import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slacker/widgets/pill_dropdown.dart';
import 'package:slacker/widgets/state_display_card.dart';

//TODO: maybe instead of dots have all state names and the selected underlined or dropdown

class StatePage extends StatefulWidget {
  final String stateName;
  final Map<String, Map<String, List<String>>> stateData;
  final int pageNumber;
  final int pageCount;

  StatePage({this.stateName, this.stateData, this.pageNumber, this.pageCount});

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
          pinned: false,
          automaticallyImplyLeading: false,
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: generatePageIndexDots(
                      widget.pageNumber, widget.pageCount),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: FittedBox(
                      child: Text(
                        widget.stateName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Line Type:'),
                    SizedBox(width: 10.0),
                    DropdownButton(
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
            //childCount: widget.stateDetails.length,
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
    returnList.add(Theme(
      data: ThemeData(
        accentColor: Colors.black,
      ),
      child: ExpansionTile(
        title: Text(region),
        children: generateAreaExpansionTiles(stateData[region]),
      ),
    ));
  });
  return returnList;
}

List<Widget> generateAreaExpansionTiles(Map<String, List<String>> regionData) {
  List<Widget> returnList = [];
  regionData.forEach((area, value) {
    returnList.add(ExpansionTile(
      title: Text(area),
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
