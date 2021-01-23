import 'package:flutter/material.dart';
import 'package:slacker/globals.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({@required this.currentTab, @required this.onSelectTab});
  final TabItem currentTab;
  final Function onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF1565C0),
      selectedLabelStyle: Theme.of(context).textTheme.bodyText1,
      unselectedLabelStyle: Theme.of(context).textTheme.bodyText1,
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
    switch (tabItem) {
      case TabItem.feed:
        {
          return Icons.rss_feed;
        }
        break;
      case TabItem.explore:
        {
          return Icons.landscape;
        }
        break;
      case TabItem.guide:
        {
          return Icons.library_books;
        }
        break;
      case TabItem.map:
        {
          return Icons.map;
        }
        break;
      case TabItem.profile:
        {
          return Icons.portrait;
        }
        break;
      default:
        {
          throw ('Could not find TabItem for bottom Navigation Bar');
        }
    }
  }
}
