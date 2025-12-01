import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomColors {
  final Color secondaryColor;
  final Color buttonSelected;
  final Color buttonUnselected;
  final Color buttonTextSelected;
  final Color buttonTextUnselected;
  const CustomColors._({
    required this.secondaryColor,
    required this.buttonSelected,
    required this.buttonUnselected,
    required this.buttonTextSelected,
    required this.buttonTextUnselected,
  });

  factory CustomColors._light() {
    return const CustomColors._(
        secondaryColor: AppColors.blackDarker,
        buttonSelected: AppColors.purplePrimary,
        buttonUnselected: AppColors.greyLighter,
        buttonTextSelected: Colors.white,
        buttonTextUnselected: AppColors.greyPrimary);
  }

  factory CustomColors._dark() {
    return const CustomColors._(
        secondaryColor: AppColors.greyLighter,
        buttonSelected: Color(
            0xFF6C7FFF),
        buttonUnselected: Color(0xFF2A2A2A), 
        buttonTextSelected: Colors.white,
        buttonTextUnselected: Color(0xFFB0B0B0));
  }
}

extension CustomColorExtension on ThemeData {
  CustomColors get customColors =>
      brightness == Brightness.dark
          ? CustomColors._dark()
          : CustomColors._light();
}
