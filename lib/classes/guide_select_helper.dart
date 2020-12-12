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
            pageCount: _numberOfStates,
            pageNumber: _stateCounter,
            stateDetails: [
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3',
              'item1',
              'item2',
              'item3'
            ],
          ),
        );
        _stateCounter++;
      },
    );
    return _pageViewChildren;
  }
}
