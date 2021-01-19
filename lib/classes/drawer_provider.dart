import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../globals.dart';
import 'model_classes/state_class.dart';
import 'model_classes/region_class.dart';
import 'model_classes/area_class.dart';

class DrawerProvider with ChangeNotifier {
  Region currentRegion;
  Area currentArea;

  void selectRegion(Region region) {
    currentRegion = region;
    notifyListeners();
  }
}
