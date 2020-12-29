import 'package:flutter/material.dart';
import 'package:slacker/widgets/custom_expansion_tile.dart';
import 'package:slacker/widgets/dropdown_container.dart';

import 'model_classes/area_class.dart';
import 'model_classes/country_class.dart';
import 'model_classes/guide_class.dart';
import 'model_classes/region_class.dart';
import 'model_classes/state_class.dart';

class GuideSelectHelper {
  static List<Widget> generateStateGuidePage({
    States state,
  }) {
    List<Widget> returnList = [];
    state.regions.forEach((Region region) {
      returnList.add(
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              border: Border(top: BorderSide(color: Colors.black))),
          child: Text(
            region.regionName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
      region.areas.forEach((Area area) {
        returnList.add(
          DropdownContainer(
            header: area.areaName,
            children:
                area.guides.map((Guide guide) => guide.guideName).toList(),
            headerContractedColor: Colors.blueGrey[50],
            headerExpandedColor: Colors.blueGrey[100],
            headerExpandedTextStyle:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            headerContractedTextStyle: TextStyle(fontSize: 18.0),
          ),
        );
      });
    });
    return returnList;
  }
}
