import 'package:flutter/foundation.dart';

@immutable
class Planet {
  const Planet({
    required this.name,
    required this.imagePath,
    required this.modelPath,
    required this.viewerZoom,
    required this.title,
    required this.about,
    required this.distanceFromSunKm,
    required this.lengthOfDayHours,
    required this.orbitalPeriodYears,
    required this.radiusKm,
    required this.massKg,
    required this.gravityMs2,
    required this.surfaceAreaKm2,
  });

  final String name;
  final String imagePath;
  final String modelPath;

  final double viewerZoom;

  final String title;
  final String about;

  final String distanceFromSunKm;
  final String lengthOfDayHours;
  final String orbitalPeriodYears;
  final String radiusKm;
  final String massKg;
  final String gravityMs2;
  final String surfaceAreaKm2;
}
