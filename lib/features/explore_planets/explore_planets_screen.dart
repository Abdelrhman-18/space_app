import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:space_app/core/theme/app_theme.dart';
import 'package:space_app/core/widgets/screen_header_banner.dart';
import 'package:space_app/features/explore_planets/explore_planets_provider.dart';
import 'package:space_app/features/explore_planets/widgets/explore_planet_button.dart';
import 'package:space_app/features/explore_planets/widgets/planet_selector_row.dart';

class ExplorePlanetsScreen extends StatelessWidget {
  const ExplorePlanetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanetSelectionProvider(),
      child: const _ExplorePlanetsBody(),
    );
  }
}

class _ExplorePlanetsBody extends StatefulWidget {
  const _ExplorePlanetsBody();

  @override
  State<_ExplorePlanetsBody> createState() => _ExplorePlanetsBodyState();
}

class _ExplorePlanetsBodyState extends State<_ExplorePlanetsBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: context.read<PlanetSelectionProvider>().selectedIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToOffset(int offset) {
    final provider = context.read<PlanetSelectionProvider>();
    final targetIndex = provider.selectedIndex + offset;
    if (targetIndex < 0 || targetIndex >= provider.planets.length) return;
    _pageController.animateToPage(
      targetIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final planets = context.read<PlanetSelectionProvider>().planets;

    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 1, child: ScreenHeaderBanner(title: 'Explore')),
          Expanded(
            flex: 4,
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppTheme.defaultPadding,
                      AppTheme.defaultPadding,
                      AppTheme.defaultPadding,
                      0,
                    ),
                    child: Text(
                      'Which planet\nwould you like to explore?',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: planets.length,
                      onPageChanged: (index) => context
                          .read<PlanetSelectionProvider>()
                          .selectPlanet(index),
                      itemBuilder: (context, index) {
                        return Center(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                AppTheme.defaultPadding,
                              ),
                              child: Image.asset(
                                planets[index].imagePath,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.public, size: 96),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.defaultPadding,
                    ),
                    child: PlanetSelectorRow(
                      onPrevious: () => _goToOffset(-1),
                      onNext: () => _goToOffset(1),
                    ),
                  ),
                  const SizedBox(height: AppTheme.defaultPadding),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppTheme.defaultPadding,
                    ),
                    child: ExplorePlanetButton(),
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
