import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/home/presentation/cubit/news/category_news_cubit.dart';
import 'package:news_app/features/home/presentation/widget/category_button.dart';
import 'package:news_app/features/home/presentation/widget/home_header.dart';
import 'package:news_app/features/home/presentation/widget/preview_slide.dart';
import 'package:news_app/features/home/presentation/widget/top_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryNewsCubit>()..init(),
      child: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    // print('Build Home Screen');
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 10.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeHeader()),
          // SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          // SliverToBoxAdapter(child: CustomSearchBar()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: CategoryButton()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: PreviewSlide()),
          SliverToBoxAdapter(child: SizedBox(height: 48.h)),
          SliverToBoxAdapter(child: _TopNews()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          TopNewsSection(),
        ],
      ),
    );
  }
}

class _TopNews extends StatelessWidget {
  const _TopNews();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 20.w),
        child: Row(
          children: [
            Expanded(
              child: Text('Top News', style: context.textTheme.headlineMedium),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: context.textTheme.bodySmall,
              ),
            ),
          ],
        ));
  }
}
