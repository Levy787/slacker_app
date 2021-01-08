import 'package:flutter/material.dart';
import 'package:slacker/globals.dart';
//import 'package:nested_navigation_demo_flutter/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({@required this.currentTab, @required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  int getTabIndex() {
    if (currentTab == TabItem.feed) {
      return 0;
    } else if (currentTab == TabItem.explore) {
      return 1;
    } else if (currentTab == TabItem.guide) {
      return 2;
    } else if (currentTab == TabItem.map) {
      return 3;
    } else if (currentTab == TabItem.profile) {
      return 4;
    } else {
      throw ('Invalid tab index, does not mach on of the five given');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF1565C0),
      currentIndex: getTabIndex(),
      items: [
        _buildItem(TabItem.feed),
        _buildItem(TabItem.explore),
        _buildItem(TabItem.guide),
        _buildItem(TabItem.map),
        _buildItem(TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(_getTabIcon(tabItem)),
      label: tabName[tabItem],
    );
  }

  IconData _getTabIcon(TabItem tabItem) {
    if (tabItem == TabItem.feed) {
      return Icons.rss_feed;
    } else if (tabItem == TabItem.explore) {
      return Icons.landscape;
    } else if (tabItem == TabItem.guide) {
      return Icons.library_books;
    } else if (tabItem == TabItem.map) {
      return Icons.map;
    } else if (tabItem == TabItem.profile) {
      return Icons.portrait;
    } else {
      throw ('Could not get bottom navigation bar icon');
    }
  }
}
