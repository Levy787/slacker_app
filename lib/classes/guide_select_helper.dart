import 'package:flutter/material.dart';
import 'package:slacker/widgets/custom_expansion_tile.dart';
import 'package:slacker/widgets/dropdown_container.dart';

class GuideSelectHelper {
  static List<Widget> generateStateGuidePage({
    Map<String, Map<String, List<String>>> stateData,
    String stateName,
  }) {
    List<Widget> returnList = [];
    stateData.forEach(
      (region, value) {
        returnList.add(
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                border: Border(top: BorderSide(color: Colors.black))),
            child: Text(
              region,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
        var i = 0;
        value.forEach((area, value) {
          returnList.add(
            DropdownContainer(
              header: area,
              children: value,
              headerContractedColor: Colors.blueGrey[50],
              headerExpandedColor: Colors.blueGrey[100],
              headerExpandedTextStyle:
                  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              headerContractedTextStyle: TextStyle(fontSize: 18.0),
            ),
          );
          i++;
        });
      },
    );
    return returnList;
  }
}
