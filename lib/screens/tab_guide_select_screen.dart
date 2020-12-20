import 'package:flutter/material.dart';
import 'package:slacker/classes/highline_db_provider.dart';
import 'package:slacker/widgets/app_bars/guide_select_tab_app_bar.dart';
import 'package:slacker/widgets/text_fields/rounded_text_field.dart';
import 'package:slacker/widgets/text_fields/search_field.dart';

class TabGuideSelectScreen extends StatefulWidget {
  static const String id = 'tab_guide_select_screen';

  final Map<String, Map<String, Map<String, List<String>>>> statesJSON;
  final HighlineDbProvider db;

  TabGuideSelectScreen({this.statesJSON, this.db});

  @override
  _TabGuideSelectScreenState createState() => _TabGuideSelectScreenState();
}

class _TabGuideSelectScreenState extends State<TabGuideSelectScreen> {
  TextEditingController _controller =
      TextEditingController(); //TODO: Implement Controller
  FocusNode focusNode;
  bool isFocused = false;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(onFocusChanged);
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
    final List<String> _tabs = [
      'Tasmania',
      'Victoria',
      'New South Wales',
      'Australian Capital Territory',
      'South Australia',
      'Western Australia',
      'Queensland',
      'Northern Territory'
    ];

    int counter = 0;

    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Text(
            'Slackline Guide',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: GuideSelectTabAppBar(
                    tabs: _tabs,
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
              children: _tabs.map((String name) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8.0),
                            sliver: SliverFixedExtentList(
                              itemExtent: 48.0,
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text('Item $index'),
                                  );
                                },
                                childCount: 30,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        //TODO: Add Bottom Navigation Bar
      ),
    );
  }
}
