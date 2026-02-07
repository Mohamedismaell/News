import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/onboarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:news_app/features/onboarding/presentation/widgets/onboarding_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(height: 76.h),
          OnboardingPages(
              pageController: pageController,
              carouselController: carouselController),

          // Spacer(),
          SizedBox(height: 15.h),
          SmoothPageIndicator(
            controller: pageController,
            count: 2,
            effect: ExpandingDotsEffect(
              dotColor: context.colorTheme.surface,
              activeDotColor: context.colorTheme.primary,
            ),
            // onDotClicked: (index) {},
          ),
          SizedBox(height: 15.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: ElevatedButton(
              onPressed: () {
                pageController.page == 1
                    ? context.read<OnboardingCubit>().finishOnboarding()
                    : pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn,
                      );
                // print('pageController.page == > ${pageController.page}');
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
