import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_color_schemes.dart';
import 'package:news_app/core/theme/app_text_theme.dart';
import '../app_colors.dart';

ThemeData getLightTheme() {
  final rawTextTheme = AppTextTheme.from(lightColorScheme);
  final responsiveTextTheme = rawTextTheme.apply(fontSizeFactor: 1.sp);
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: responsiveTextTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: AppTextTheme.from(lightColorScheme).titleLarge,
    ),
    // //! input
    // inputDecorationTheme: InputDecorationTheme(
    //   // border: InputBorder.none,
    //   filled: true,
    //   fillColor: AppColors.surfaceLight,
    //   hintStyle: AppTextTheme.from(lightColorScheme).labelMedium,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide(color: AppColors.outlineLight),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide(color: AppColors.outlineLight),
    //   ),
    // ),
    // //! dialog
    // dialogTheme: DialogThemeData(
    //   backgroundColor: AppColors.backgroundLight,
    //   titleTextStyle: AppTextTheme.from(lightColorScheme).titleLarge,
    //   contentTextStyle: AppTextTheme.from(lightColorScheme).bodyLarge,
    //   shape:
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    // ),
    //! ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // fixedSize: Size(double.infinity, 40.h),
        shadowColor: lightColorScheme.primary.withValues(alpha: 0.25),
        elevation: 10,
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        textStyle: responsiveTextTheme.bodyLarge?.copyWith(inherit: true),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
    ),
    // //! checkbox
    // checkboxTheme: CheckboxThemeData(
    //   checkColor: WidgetStateProperty.resolveWith((states) {
    //     if (states.contains(WidgetState.selected)) return Colors.white;
    //     return Colors.grey;
    //   }),
    //   side: BorderSide(width: 3, color: lightColorScheme.outline),
    // ),
    // splashFactory: NoSplash.splashFactory,
    // popupMenuTheme: PopupMenuThemeData(
    //   color: AppColors.backgroundLight,
    //   labelTextStyle: WidgetStateProperty.all(
    //     responsiveTextTheme.titleSmall?.copyWith(),
    //   ),
    //   elevation: 1,
    //   shadowColor: AppColors.backgroundDark,
    //   shape:
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    // ),
    // bottomSheetTheme: BottomSheetThemeData(
    //   backgroundColor: AppColors.backgroundLight,
    //   shape:
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    // )
  );
}

// extension ShortTheme on BuildContext {
//   TextTheme get text => Theme.of(this).textTheme;
//   ColorScheme get colors => Theme.of(this).colorScheme;

// }
