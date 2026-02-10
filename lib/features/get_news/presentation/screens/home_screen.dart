import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/core/manager/theme/theme_cubit.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';

import '../../../../core/enums/news_category.dart';
import '../widget/preview_slide.dart';
import '../widget/top_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _HomeBody();
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    // print('Build Home Screen');
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _HomeHeader()),
          SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          SliverToBoxAdapter(child: _BarSearch()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(child: _CategoryButton()),
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

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Browse', style: context.textTheme.headlineMedium),
            SizedBox(height: 8.h),
            Text('Discover thing of this world',
                style: context.textTheme.bodySmall)
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: Icon(Icons.wb_sunny_outlined))
      ],
    );
  }
}

class _BarSearch extends StatelessWidget {
  const _BarSearch();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 24.sp,
            color: AppColors.greyPrimary,
          ),
          hintText: 'Search',
          // isCollapsed: true,
          suffixIcon: Icon(
            Icons.mic,
            size: 24.sp,
            color: AppColors.greyPrimary,
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: NewsCategory.values.map((
              category,
            ) {
              final isSelected = state.selectedCategory == category.value;
              return Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? context.colorTheme.primary
                              : context.colorTheme.surface,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r)),
                          elevation: 0),
                      onPressed: () => context
                          .read<NewsCubit>()
                          .selectCategory(category.value),
                      child: Text(
                        category.value.split(',').first.trim(),
                        style: context.textTheme.labelSmall!.copyWith(
                            color: isSelected
                                ? context.colorTheme.onPrimary
                                : context.colorTheme.onSurface),
                      )));
            }).toList(),
          ),
        );
      },
    );
  }
}

class _TopNews extends StatelessWidget {
  const _TopNews();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
