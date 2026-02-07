import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/on_boarding/presentation/models/user_details.dart';

class OnboardingPages extends StatelessWidget {
  const OnboardingPages({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: OnboardingModel.onboardingList.length,
        itemBuilder: (context, index) {
          final item = OnboardingModel.onboardingList[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    height: 336.0,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 1300),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.2,
                    animateToClosest: true,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                  ),
                  disableGesture: true,
                  items: item.imagePath
                      .map((i) => Builder(
                          builder: (BuildContext context) => Image.asset(
                                i,
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              )))
                      .toList()),
              SizedBox(height: 82.h),
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
