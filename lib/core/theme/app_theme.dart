import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'app_colors.dart';

final TextTheme mytextTheme = const TextTheme(
  displayLarge: AppTextStyles.headline1,
  displayMedium: AppTextStyles.headline2,
  headlineLarge: AppTextStyles.subtitle1,
  bodyLarge: AppTextStyles.body1,
  bodyMedium: AppTextStyles.body2,
  labelLarge: AppTextStyles.button,
);
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  scaffoldBackgroundColor: AppColors.white,

  colorScheme: ColorScheme.light(
    primary: AppColors.purplePrimary,
    secondary: AppColors.purpleLight,
    surface: AppColors.white,
    onPrimary: AppColors.white,
    onSurface: AppColors.blackPrimary,
  ),

  textTheme: mytextTheme,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  scaffoldBackgroundColor: AppColors.blackPrimary,

  colorScheme: const ColorScheme.dark(
    primary: AppColors.purpleLight,
    secondary: AppColors.purpleLighter,
    surface: AppColors.blackPrimary,
    onPrimary: AppColors.blackDarker,
    onSurface: AppColors.white,
  ),

  textTheme: mytextTheme,
);

extension ShortTheme on BuildContext {
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
