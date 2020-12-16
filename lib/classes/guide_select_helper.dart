import 'package:flutter/material.dart';
import 'package:slacker/widgets/state_page.dart';

class GuideSelectHelper {
  List<Widget> createStatePages(
      Map<String, Map<String, Map<String, List<String>>>> jsonData) {
    List<Widget> _pageViewChildren = [];
    int _numberOfStates = jsonData.keys.length;
    int i = 1;

    jsonData.forEach(
      (state, value) {
        _pageViewChildren.add(
          StatePage(
            stateName: state,
            stateData: value,
            pageCount: _numberOfStates,
            pageNumber: i,
          ),
        );
        i++;
      },
    );
    return _pageViewChildren;
  }
}
