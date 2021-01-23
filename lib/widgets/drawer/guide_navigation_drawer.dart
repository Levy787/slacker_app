import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slacker/services/providers/drawer_provider.dart';
import 'package:slacker/models/area_class.dart';
import 'package:slacker/models/region_class.dart';
import 'package:slacker/models/states_class.dart';
import 'package:slacker/services/providers/state_provider.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DrawerProvider drawerProvider =
        Provider.of<DrawerProvider>(context, listen: false);
    return Drawer(
      child: Consumer<DrawerProvider>(
        builder: (context, drawerProvider, _) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                title: Selector<DrawerProvider, String>(
                  selector: (context, drawerProvider) => drawerProvider.heading,
                  builder: (context, heading, ___) => Text(
                    heading,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => drawerProvider.builder(index),
                  childCount: drawerProvider.childCount,
                ),
              ),
            ],
          );
        },
      ),

      /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.0,
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
      ),*/
    );
  }
}
