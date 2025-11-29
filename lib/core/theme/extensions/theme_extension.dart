import 'package:flutter/material.dart';
import 'package:news_app/core/theme/extensions/custom_colors.dart';

extension Contextext on BuildContext {
  CustomColors get customColors {
    return Theme.of(this).customColors;
  }
}
