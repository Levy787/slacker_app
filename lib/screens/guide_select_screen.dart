import 'package:flutter/material.dart';
import 'package:slacker/classes/guide_select_helper.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:slacker/widgets/app_bars/guide_select_tab_app_bar.dart';

class GuideSelectScreen extends StatefulWidget {
  static const String id = 'guide_select_screen';

  final Map<String, Map<String, Map<String, List<String>>>> statesJSON;
  final HighlineDbProvider db;

  GuideSelectScreen({this.statesJSON, this.db});

  @override
  _GuideSelectScreenState createState() => _GuideSelectScreenState();
}

class _GuideSelectScreenState extends State<GuideSelectScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode;
  bool isFocused = false;
  List<String> stateTabs;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(onFocusChanged);
    stateTabs = widget.statesJSON.keys.toList();
    super.initState();
  }

  void onFocusChanged() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusChanged);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Takes focus off Search Bar
        focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            'Slackline Guide',
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
        body: DefaultTabController(
          length: stateTabs.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: GuideSelectTabAppBar(
                    tabs: stateTabs,
                    focusNode: focusNode,
                    isFocused: isFocused,
                    unFocus: () => focusNode.unfocus(),
                    onFocusChanged: onFocusChanged,
                    innerBoxIsScrolled: innerBoxIsScrolled,
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: stateTabs.map((String name) {
                return Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              if (widget.statesJSON[name].length == 0) {
                                return ListTile(
                                  title: Text('Comming Soon!'),
                                );
                              } else {
                                List<Widget> stateDetailList =
                                    GuideSelectHelper.generateStateGuidePage(
                                        stateData: widget.statesJSON[name],
                                        stateName: name);
                                return stateDetailList[index];
                              }
                            },
                            childCount: widget.statesJSON[name].length == 0
                                ? 1
                                : GuideSelectHelper.generateStateGuidePage(
                                        stateData: widget.statesJSON[name],
                                        stateName: name)
                                    .length,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          currentIndex: 1,
          onTap: (index) {
            print(widget.statesJSON);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.landscape), label: 'Guide'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Line'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
