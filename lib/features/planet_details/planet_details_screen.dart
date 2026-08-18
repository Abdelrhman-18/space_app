import 'package:flutter/material.dart';

import 'package:space_app/core/theme/app_theme.dart';
import 'package:space_app/core/widgets/circle_icon_button.dart';
import 'package:space_app/core/widgets/screen_header_banner.dart';
import 'package:space_app/features/planet_details/planet_model_viewer.dart';
import 'package:space_app/features/planets/planet.dart';

const double _viewerHeight = 320;

class PlanetDetailsScreen extends StatelessWidget {
  const PlanetDetailsScreen({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ScreenHeaderBanner(
              title: planet.name,
              leading: CircleIconButton(
                icon: Icons.arrow_back,
                onPressed: () => Navigator.pop(context),
                semanticLabel: 'Back',
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(planet.title, style: textTheme.titleLarge),
                    const SizedBox(height: AppTheme.defaultPadding),
                    SizedBox(
                      height: _viewerHeight,
                      width: double.infinity,
                      child: PlanetModelViewer(
                        modelPath: planet.modelPath,
                        imagePath: planet.imagePath,
                        viewerZoom: planet.viewerZoom,
                      ),
                    ),
                    const SizedBox(height: AppTheme.defaultPadding),
                    Text('About', style: textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(planet.about, style: textTheme.bodyMedium),
                    const SizedBox(height: AppTheme.defaultPadding),
                    _PlanetFacts(planet: planet),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanetFacts extends StatelessWidget {
  const _PlanetFacts({required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final facts = <(String, String)>[
      ('Distance from Sun (km)', planet.distanceFromSunKm),
      ('Length of Day (hours)', planet.lengthOfDayHours),
      ('Orbital Period (Earth years)', planet.orbitalPeriodYears),
      ('Radius (km)', planet.radiusKm),
      ('Mass (kg)', planet.massKg),
      ('Gravity (m/s²)', planet.gravityMs2),
      ('Surface Area (km²)', planet.surfaceAreaKm2),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (label, value) in facts)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: textTheme.bodyMedium),
                Text(value, style: textTheme.titleMedium),
              ],
            ),
          ),
      ],
    );
  }
}
