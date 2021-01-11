import 'package:flutter/material.dart';
import 'package:slacker/globals.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({@required this.currentTab, @required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF1565C0),
      currentIndex: TabItem.values.indexOf(currentTab),
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
