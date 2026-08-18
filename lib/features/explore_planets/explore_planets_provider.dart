import 'package:flutter/foundation.dart';

import 'package:space_app/features/planets/planet.dart';
import 'package:space_app/features/planets/planets_data.dart';

class PlanetSelectionProvider extends ChangeNotifier {
  static const List<Planet> _planets = planetsData;

  int _selectedIndex = defaultPlanetIndex;

  List<Planet> get planets => _planets;
  int get selectedIndex => _selectedIndex;
  Planet get selectedPlanet => _planets[_selectedIndex];
  bool get canGoPrevious => _selectedIndex > 0;
  bool get canGoNext => _selectedIndex < _planets.length - 1;

  void selectPlanet(int index) {
    if (index < 0 || index >= _planets.length || index == _selectedIndex) {
      return;
    }
    _selectedIndex = index;
    notifyListeners();
  }
}
