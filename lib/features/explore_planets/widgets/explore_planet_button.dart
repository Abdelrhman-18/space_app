import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:space_app/core/widgets/primary_action_button.dart';
import 'package:space_app/features/explore_planets/explore_planets_provider.dart';
import 'package:space_app/features/planet_details/planet_details_screen.dart';

class ExplorePlanetButton extends StatelessWidget {
  const ExplorePlanetButton({super.key});

  @override
  Widget build(BuildContext context) {
    final name = context.select<PlanetSelectionProvider, String>(
      (provider) => provider.selectedPlanet.name,
    );

    return PrimaryActionButton(
      label: 'Explore $name',
      onPressed: () {
        final selectedPlanet = context
            .read<PlanetSelectionProvider>()
            .selectedPlanet;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlanetDetailsScreen(planet: selectedPlanet),
          ),
        );
      },
    );
  }
}
