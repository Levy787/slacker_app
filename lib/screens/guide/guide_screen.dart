import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slacker/models/states_class.dart';
import 'package:slacker/constants.dart';
import 'package:slacker/services/providers/tab_provider.dart';

class GuideScreen extends StatelessWidget {
  static const String id = 'guide_screen';

  List<Widget> pageGenerator(States state) {
    List<Widget> returnList = [];
    returnList.add(Text(
      state.stateName,
      style: kStateStyle,
    ));
    for (var region in state.regions) {
      returnList.add(Text(
        '  ${region.regionName}',
        style: kRegionStyle,
      ));
      for (var area in region.areas) {
        returnList.add(Text(
          '      ${area.areaName}',
          style: kAreaStyle,
        ));
        for (var guide in area.guides) {
          returnList.add(Text(
            '          ${guide.guideName}',
            style: kGuideStyle,
          ));
        }
      }
    }
    return returnList;
  }

  @override
  Widget build(BuildContext context) {
    States state =
        Provider.of<TabProvider>(context, listen: false).exploreStateCache;
    return Container(
      child: ListView(
        children: pageGenerator(state),
      ),
    );
  }
}
