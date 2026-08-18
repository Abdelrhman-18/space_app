import 'package:flutter/material.dart';

import 'package:space_app/core/constants/app_assets.dart';
import 'package:space_app/core/theme/app_theme.dart';

class ScreenHeaderBanner extends StatelessWidget {
  const ScreenHeaderBanner({super.key, required this.title, this.leading});

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AppAssets.headerBackgroundImage, fit: BoxFit.cover),
        const DecoratedBox(
          decoration: BoxDecoration(gradient: AppTheme.headerGradient),
        ),
        Center(
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        if (leading != null)
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: leading,
              ),
            ),
          ),
      ],
    );
  }
}
