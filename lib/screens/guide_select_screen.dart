import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:slacker/classes/guide_select_helper.dart';
//import 'package:flutter/services.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:slacker/constants.dart';
import 'package:slacker/screens/state_detail_screen.dart';
import 'package:slacker/widgets/state_tile.dart';
import 'package:slacker/widgets/state_page.dart';

class GuideSelectScreen extends StatefulWidget {
  static const id = 'guide_select_screen';
  final GuideSelectHelper guideSelectHelper = GuideSelectHelper();
  final Map<String, Map<String, Map<String, List<String>>>> statesJSON;
  final HighlineDbProvider db;

  GuideSelectScreen({this.statesJSON, this.db});

  @override
  _GuideSelectScreen createState() => _GuideSelectScreen();
}

class _GuideSelectScreen extends State<GuideSelectScreen> {
  @override
  void initState() {
    super.initState();
    widget.guideSelectHelper.createStatePages(widget.statesJSON);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [Icon(Icons.search_sharp)],
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: PageView(
          pageSnapping: true,
          children:
              widget.guideSelectHelper.createStatePages(widget.statesJSON),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (index) {
          print(widget.statesJSON);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.landscape), label: 'Guide'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Line'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

List<String> states = [
  'Tasmania',
  'New South Wales',
  'Queensland',
  'Victoria',
  'Australian Capital Territory',
  'Western Australia',
  'South Australia',
  'Northern Territory',
];

List<String> stateDetails = [
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
  'item 3',
  'item 1',
  'item 2',
];
