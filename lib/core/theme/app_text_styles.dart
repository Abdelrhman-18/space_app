import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static const String _inter = 'Inter';
  static const String _spaceGrotesk = 'Space Grotesk';

  static const TextStyle largeTitle = TextStyle(
    fontFamily: _inter,
    fontSize: 48,
    fontWeight: FontWeight.w900,
    fontVariations: [FontVariation('wght', 900)],
    letterSpacing: 0,
    color: AppColors.white,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: _spaceGrotesk,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontVariations: [FontVariation('wght', 700)],
    height: 1.5,
    letterSpacing: -0.72,
    color: AppColors.white,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _spaceGrotesk,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontVariations: [FontVariation('wght', 700)],
    height: 2.25,
    letterSpacing: -0.48,
    color: AppColors.white,
  );

  static const TextStyle bodyLight = TextStyle(
    fontFamily: _spaceGrotesk,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontVariations: [FontVariation('wght', 300)],
    height: 1.375,
    letterSpacing: 0,
    color: AppColors.white,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: _spaceGrotesk,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontVariations: [FontVariation('wght', 700)],
    color: AppColors.white,
  );
}
