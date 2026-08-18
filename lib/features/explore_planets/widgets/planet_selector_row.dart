import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:space_app/core/widgets/circle_icon_button.dart';
import 'package:space_app/features/explore_planets/explore_planets_provider.dart';

class PlanetSelectorRow extends StatelessWidget {
  const PlanetSelectorRow({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PlanetSelectionProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleIconButton(
          icon: Icons.arrow_back,
          onPressed: provider.canGoPrevious ? onPrevious : null,
          semanticLabel: 'Previous planet',
        ),
        Text(
          provider.selectedPlanet.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        CircleIconButton(
          icon: Icons.arrow_forward,
          onPressed: provider.canGoNext ? onNext : null,
          semanticLabel: 'Next planet',
        ),
      ],
    );
  }
}
