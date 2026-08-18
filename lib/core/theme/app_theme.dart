import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static const double defaultPadding = 16.0;

  static const double actionIconSize = 22.0;

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, AppColors.background],
  );

  static const ColorScheme _colorScheme = ColorScheme.dark(
    primary: AppColors.accent,
    onPrimary: AppColors.white,
    surface: AppColors.background,
    onSurface: AppColors.white,
  );

  static const TextTheme _textTheme = TextTheme(
    headlineLarge: AppTextStyles.largeTitle,
    titleLarge: AppTextStyles.titleLarge,
    titleMedium: AppTextStyles.titleMedium,
    bodyMedium: AppTextStyles.bodyLight,
    labelLarge: AppTextStyles.buttonText,
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.all(defaultPadding),
          elevation: 0,
          iconSize: actionIconSize,
          textStyle: AppTextStyles.buttonText,
          shape: const StadiumBorder(),
        ),
      );

  static const IconThemeData _iconTheme = IconThemeData(
    color: AppColors.white,
    size: actionIconSize,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      iconTheme: _iconTheme,
    );
  }
}
