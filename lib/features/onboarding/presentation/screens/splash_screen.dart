import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(AppRoutes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purplePrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/logo-icon.svg',
              width: 48.w,
            ),
            SizedBox(height: 24.h),
            SvgPicture.asset(
              'assets/images/logo-text.svg',
              width: 120.w,
            ),
          ],
        ),
      ),
    );
  }
}
