import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

//! LIGHT SCHEME
final ColorScheme lightColorScheme = ColorScheme.light(
  brightness: Brightness.light,

  // Primary action
  primary: AppColors.purplePrimary,
  onPrimary: AppColors.white,

  // Surfaces
  surface: AppColors.greyLighter,
  onSurface: AppColors.greyPrimary,

  // surfaceContainer: AppColors.greyLighter.withOpacity(0.4),

  // Accent / highlight
  secondary: AppColors.purpleDarker,
  onSecondary: AppColors.white,

  // Status
  error: Colors.red,
  onError: AppColors.white,
);

//! DARK SCHEME
final ColorScheme darkColorScheme = ColorScheme.dark(
  brightness: Brightness.dark,

  // Primary action
  // primary: AppSemanticColors.primaryActionDark,
  // onPrimary: AppSemanticColors.onPrimaryActionDark,

  // // Accent / highlight
  // secondary: AppSemanticColors.accentDark,
  // onSecondary: AppSemanticColors.textPrimaryDark,

  // // Surfaces
  // surface: AppSemanticColors.surfaceDark,
  // onSurface: AppSemanticColors.textPrimaryDark,
  // surfaceContainer: AppSemanticColors.surfaceMutedDark.withOpacity(0.1),
  // // Status
  // error: Colors.red,
  // onError: AppSemanticColors.onPrimaryActionDark,
);
