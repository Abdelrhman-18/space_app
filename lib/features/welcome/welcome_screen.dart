import 'package:flutter/material.dart';

import 'package:space_app/core/constants/app_assets.dart';
import 'package:space_app/core/theme/app_theme.dart';
import 'package:space_app/core/widgets/primary_action_button.dart';
import 'package:space_app/features/explore_planets/explore_planets_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.welcomeBackgroundImage,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 38),
                  Text(
                    'Explore\nThe\nUniverse',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Spacer(flex: 62),
                  PrimaryActionButton(
                    label: 'Explore',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ExplorePlanetsScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppTheme.defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
