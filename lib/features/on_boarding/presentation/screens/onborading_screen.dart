import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/on_boarding/presentation/widgets/onboarding_pages.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 76.h),
          OnboardingPages(
            pageController: pageController,
          ),

          // Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Color(0xff5424FD).withValues(alpha: 0.6),
                elevation: 10.r,
              ),
              onPressed: () {
                pageController.page == 2
                    ? null
                    : pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                print(pageController.page);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Next'),
                  // SizedBox(width: 8.w),
                  // Icon(Icons.arrow_forward_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
