import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slacker/services/providers/drawer_provider.dart';
import 'package:slacker/models/area_class.dart';
import 'package:slacker/models/region_class.dart';
import 'package:slacker/models/states_class.dart';
import 'package:slacker/services/providers/tab_provider.dart';

class NavigationDrawer extends StatelessWidget {
  List<Widget> _buildList({
    BuildContext context,
    Region currentRegion,
    Area currentArea,
    Function onTap,
  }) {
    if (currentRegion == null && currentArea == null) {
      return _buildRegionTiles(
          Provider.of<TabProvider>(context).exploreStateCache);
    } else {
      throw ('Error');
    }
  }

  List<Widget> _buildRegionTiles(States state) {
    return List.generate(
      state.regions.length,
      (index) => ListTile(
        title: Text(state.regions[index].regionName),
        onTap: () => print(state.regions[index].regionName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DrawerProvider navigationProvider =
        Provider.of<DrawerProvider>(context, listen: false);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70.0,
            width: double.infinity,
            color: Colors.blue,
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: _buildList(
                    context: context,
                    currentRegion: navigationProvider.currentRegion,
                    currentArea: navigationProvider.currentArea),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
