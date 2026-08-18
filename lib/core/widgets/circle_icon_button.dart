import 'package:flutter/material.dart';

import 'package:space_app/core/theme/app_colors.dart';
import 'package:space_app/core/theme/app_theme.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.semanticLabel,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      tooltip: semanticLabel,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.accent,
        disabledBackgroundColor: AppColors.accent.withValues(alpha: 0.4),
        foregroundColor: AppColors.white,
        iconSize: AppTheme.actionIconSize,
        shape: const CircleBorder(),
      ),
    );
  }
}
