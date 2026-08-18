import 'package:flutter/material.dart';

import 'package:space_app/core/theme/app_theme.dart';
import 'package:space_app/features/welcome/welcome_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space App',
      theme: AppTheme.darkTheme,
      home: const WelcomeScreen(),
    );
  }
}
