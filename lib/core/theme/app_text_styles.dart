import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_font_family.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();
  static TextStyle _textline(double size, FontWeight weight,
          {Color? color}) =>
      TextStyle(
        fontSize: size,
        fontWeight: weight,
        fontFamily: AppFontFamily.sfPro,
        color: color,
      );
  static final textRegular = _textline(16, FontWeight.w400);
  static final textMedium = _textline(16, FontWeight.w500);
  static final textSemibold =
      _textline(16, FontWeight.w600);
  static final textBold = _textline(16, FontWeight.w700);

  //!Head Line Semi_bold
  static final headlLineLarge = _textline(
    24,
    FontWeight.w600,
    color: AppColors.blackPrimary,
  );
  static final headlLineMedium = _textline(
    20,
    FontWeight.w600,
    color: AppColors.blackPrimary,
  );
  static final headlLineSmall = _textline(
    16,
    FontWeight.w600,
    color: AppColors.blackPrimary,
  );

  //!Hint text
  static final hintTextlarge = _textline(
    16,
    FontWeight.w400,
    color: AppColors.greyPrimary,
  );
  static final hintTextSmall = _textline(
    14,
    FontWeight.w400,
    color: AppColors.greyPrimary,
  );
}
