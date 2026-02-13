import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/onboarding/presentation/models/user_details.dart';

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({
    super.key,
    required this.pageController,
    // required this.carouselController,
  });
  final PageController pageController;
  // final CarouselSliderController carouselController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: OnboardingModel.onboardingList.length,
        itemBuilder: (context, index) {
          final item = OnboardingModel.onboardingList[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImageSlider(
                item: item,
                isSingleImage: item.imagePath.length == 1,
                // carouselController: carouselController,
              ),
              Text(
                textAlign: TextAlign.center,
                item.title,
                style: context.textTheme.headlineLarge,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: 220.w,
                child: Text(
                    textAlign: TextAlign.center,
                    'All news in one place, be the first to know last news',
                    style: context.textTheme.bodyLarge),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildImageSlider({
  required OnboardingModel item,
  required bool isSingleImage,
  // CarouselSliderController? carouselController
}) {
  return Expanded(
    child: CarouselSlider(
        // carouselController: carouselController,
        options: CarouselOptions(
          viewportFraction: isSingleImage ? 1 : 0.8,
          height: 336.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 1300),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: isSingleImage ? 0 : 0.2,
          animateToClosest: true,
          scrollDirection: Axis.horizontal,
          enableInfiniteScroll: false,
        ),
        disableGesture: true,
        items: item.imagePath
            .map((i) => Builder(
                builder: (BuildContext context) => Container(
                      width: MediaQuery.sizeOf(context).width,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Image.asset(
                        i,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                    )))
            .toList()),
  );
}
