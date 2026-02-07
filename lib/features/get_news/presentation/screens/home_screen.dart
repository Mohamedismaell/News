import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/core/theme/manager/theme_cubit.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/utility.dart';
import '../../data/datasources/news_category.dart';
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 60.0,
        left: 28.0,
        right: 16.01,
      ),
      child: ListView(
        children: [
          _HomeHeader(),
          addVertical(32),
          _BarSearch(),
          addVertical(24),
          _CategoryButton(),
          addVertical(24),
          PreviewSlide(),
          addVertical(48),
          _TopNews(),
          addVertical(24),
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
            Text('Browse',
                style: AppTextStyles.headlLineLarge
                    .copyWith(color: context.customColors.secondaryColor)),
            addVertical(8),
            Text('Discover thing of this world',
                style: AppTextStyles.hintTextlarge.copyWith(
                    // color: context
                    //     .customColors.secondaryColor)
                    ))
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
      width: 336,
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.customColors.searchBarUnseected,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 30,
            color: AppColors.greyPrimary,
          ),
          addHorizental(24),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppTextStyles.textMedium
                    .copyWith(color: AppColors.greyPrimary),
                border: InputBorder.none,
                isCollapsed: true, // removes default vertical padding
              ),
              // style: context.text.headlineLarge,
            ),
          ),
          Icon(
            Icons.mic,
            size: 30,
            color: AppColors.greyPrimary,
          ),
        ],
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
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? context.customColors.buttonSelected
                            : context.customColors.buttonUnselected,
                      ),
                      onPressed: () => context
                          .read<NewsCubit>()
                          .selectCategory(category.value),
                      child: Text(
                        category.value.split(',').first.trim(),
                        style: AppTextStyles.textSemibold.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.greyPrimary,
                        ),
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
          child: Text('Top News',
              style: AppTextStyles.headlLineLarge
                  .copyWith(color: context.customColors.secondaryColor)),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: AppTextStyles.hintTextlarge
                .copyWith(color: context.customColors.secondaryColor),
          ),
        ),
      ],
    );
  }
}
