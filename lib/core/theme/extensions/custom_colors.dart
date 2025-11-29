import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomColors {
  CustomColor._();
  final Color secondaryColor;

  const CustomColors._({required this.secondaryColor});

  factory CustomColors._light() {
    return const CustomColors._(
        secondaryColor: AppColors.blackDarker);
  }
  factory CustomColors._dark() {
    return const CustomColors._(
        secondaryColor: AppColors.greyLighter);
  }
}

extension CustomColorExtension on ThemeData {
  CustomColors get customColors =>
      brightness == Brightness.dark
          ? CustomColors._dark()
          : CustomColors._light();
}
