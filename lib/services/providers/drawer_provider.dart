import 'package:flutter/material.dart';
import 'package:slacker/models/area_class.dart';
import 'package:slacker/models/region_class.dart';
import 'package:slacker/models/states_class.dart';

enum DrawerLevel { State, Region, Area }

class DrawerProvider extends ChangeNotifier {
  DrawerProvider(this.state) : heading = state.stateName;

  DrawerLevel currentLevel = DrawerLevel.State;

  String heading;

  States state;
  Region currentRegion;
  Area currentArea;

  int get childCount {
    switch (currentLevel) {
      case DrawerLevel.State:
        {
          return state.regions.length;
        }
        break;
      case DrawerLevel.Region:
        {
          return currentRegion.areas.length;
        }
        break;
      case DrawerLevel.Area:
        {
          return currentArea.guides.length;
        }
        break;
      default:
        {
          throw ('Error getting child count for guide drawer');
        }
        break;
    }
  }

  selectRegion(Region region) {
    currentRegion = region;
    heading = currentRegion.regionName;
    currentLevel = DrawerLevel.Region;
    notifyListeners();
  }

  selectArea(Area area) {
    currentArea = area;
    heading = currentArea.areaName;
    currentLevel = DrawerLevel.Area;
    notifyListeners();
  }

  back() {}

  builder(int index) {
    switch (currentLevel) {
      case DrawerLevel.State:
        {
          return ListTile(
            title: Text(state.regions[index].regionName),
            onTap: () => selectRegion(state.regions[index]),
          );
        }
        break;
      case DrawerLevel.Region:
        {
          return ListTile(
            title: Text(currentRegion.areas[index].areaName),
            onTap: () => selectArea(currentRegion.areas[index]),
          );
        }
        break;
      case DrawerLevel.Area:
        {
          return ListTile(
            title: Text(currentArea.guides[index].guideName),
            onTap: () =>
                print('${currentArea.guides[index].guideName} selected'),
          );
        }
        break;
    }
  }
}
