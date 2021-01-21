import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:slacker/models/region_class.dart';
import 'package:slacker/models/area_class.dart';

class DrawerProvider with ChangeNotifier {
  Region currentRegion;
  Area currentArea;

  void selectRegion(Region region) {
    currentRegion = region;
    notifyListeners();
  }
}
