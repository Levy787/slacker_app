import 'package:flutter/material.dart';
import 'package:slacker/classes/highline_db_provider.dart';
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
    return Scaffold(
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
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 2.0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SearchField(
                          hintText: 'Search',
                          fillColor: Color(0xfff1f2f5),
                          outlineColor: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      InkWell(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.blue, fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.white,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    isScrollable: true,
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
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
    );
  }
}
