import 'package:flutter/material.dart';
import '../app_colors.dart';

ThemeData getLightTheme() {
  return ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purplePrimary)),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.transparent,
          iconTheme:
              WidgetStateProperty.resolveWith((states) {
            return states.contains(WidgetState.selected)
                ? IconThemeData(
                    color: AppColors.purplePrimary,
                    size: 28,
                  )
                : IconThemeData(
                    color: AppColors.greyPrimary,
                    size: 28,
                  );
          })));
}

// extension ShortTheme on BuildContext {
//   TextTheme get text => Theme.of(this).textTheme;
//   ColorScheme get colors => Theme.of(this).colorScheme;
// }
