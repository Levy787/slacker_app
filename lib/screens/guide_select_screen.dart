import 'package:flutter/material.dart';
import 'package:slacker/classes/guide_select_helper.dart';
import 'package:slacker/classes/model_classes/country_class.dart';
import 'package:slacker/classes/model_classes/state_class.dart';
import 'package:slacker/widgets/app_bars/guide_select_tab_app_bar.dart';

//TODO: Adjust screen to handle new JSON

class GuideSelectScreen extends StatefulWidget {
  static const String id = 'guide_select_screen';

  final Country country;

  GuideSelectScreen({this.country});

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
    stateTabs = widget.country.states.map((state) => state.stateName).toList();
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
              children: widget.country.states.map((States state) {
                return Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(state.stateName),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              List<Widget> stateDetailList =
                                  GuideSelectHelper.generateStateGuidePage(
                                state: state,
                              );
                              return stateDetailList[index];
                            },
                            childCount:
                                GuideSelectHelper.generateStateGuidePage(
                              state: state,
                            ).length,
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
          onTap: (index) async {
            Country.getCountry('Australia', ['countryName']);
            /*List<States> states = await States.getStatesFromCountry(
                'Australia', ['stateName', 'id']);
            for (var state in states) {
              await state.addRegions(['regionName']);
            }
            for (var state in states) {
              print('state name = ${state.stateName}');
              for (var region in state.regions) {
                print('region name = ${region.regionName}');
              }
            }*/
            //widget.db.getGuideSelectScreenData('Australia');
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
