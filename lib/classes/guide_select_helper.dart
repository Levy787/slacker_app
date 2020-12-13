import 'package:flutter/material.dart';
import 'package:slacker/widgets/state_page.dart';

class GuideSelectHelper {
  List<Widget> createStatePages(
      Map<String, Map<String, Map<String, List<String>>>> jsonData) {
    //{State}, {Region}, {Area}, [Guides]
    //"Tasmania":{
    //  "North East":{
    //    "Ben Lomond":[
    //      "Flews Flutes",
    //      "Jacob’s Ladder"
    //    ],
    //  },
    //},
    //"Victoria": {....
    Map<String, Map<String, Map<String, List<String>>>> _jsonData = jsonData;
    List<Widget> _pageViewChildren = [];
    int _numberOfStates = _jsonData.keys.length;
    int _stateCounter = 1;

    _jsonData.forEach(
      (state, value) {
        _pageViewChildren.add(
          StatePage(
            stateName: state,
            stateData: value,
            pageCount: _numberOfStates,
            pageNumber: _stateCounter,
          ),
        );
        _stateCounter++;
      },
    );
    return _pageViewChildren;
  }
}
