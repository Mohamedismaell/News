import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Browse', style: context.textTheme.headlineMedium),
              SizedBox(height: 8.h),
              Text('Discover thing of this world',
                  style: context.textTheme.bodySmall),
            ],
          ),
          GestureDetector(
            onTap: () => context.pushNamed(
              'search',
              extra: {'heroTag': 'heroSearch'},
            ),
            child: Hero(
              tag: 'heroSearch',
              child: Icon(
                Icons.search,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
