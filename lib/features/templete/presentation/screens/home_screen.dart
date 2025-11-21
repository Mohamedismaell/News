import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/templete/presentation/widget/nav_bar.dart';
import 'package:news_app/utility.dart';
import '../../../../core/di/service_locator.dart';
import '../news_category.dart';
import '../widget/preview_slide.dart';
import '../widget/top_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsCubit>(),
      child: const Scaffold(
        body: _HomeBody(),
        bottomNavigationBar: NavBar(),
      ),
    );
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Browse',
          style: context.text.displayMedium!
              .copyWith(fontSize: 24),
        ),
        addVertical(8),
        Text(
          'Discover thing of this world',
          style: context.text.labelLarge!.copyWith(
            color: AppColors.greyLightDark,
          ),
        )
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
        color: Color(0xFFF3F3F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 30,
            color: Color(0xFF7C81A1),
          ),
          const SizedBox(width: 28),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: context.text.displayMedium!
                    .copyWith(color: Color(0xFF7C81A1)),
                border: InputBorder.none,
                isCollapsed:
                    true, // removes default vertical padding
              ),
              style: context.text.headlineLarge,
            ),
          ),
          Icon(
            Icons.mic,
            size: 30,
            color: Color(0xFF7C81A1),
          ),
        ],
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({super.key});

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
              final isSelected =
                  state.selectedCategory == category.value;
              return Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(
                          isSelected
                              ? const Color(0xFF465AD6)
                              : AppColors.white,
                        ),
                      ),
                      onPressed: () => context
                          .read<NewsCubit>()
                          .selectCategory(category.value),
                      child: Text(
                        category.value
                            .split(',')
                            .first
                            .trim(),
                        style: context.text.labelLarge!
                            .copyWith(
                          color: isSelected
                              ? AppColors.white
                              : const Color(0xFF465AD6),
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
          child: Text(
            'Top News',
            style: context.text.displayLarge!
                .copyWith(fontSize: 26),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyle(
              color: const Color(
                0xFF7C81A1,
              ),
              fontSize: 18,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w500,
              height: 1.71,
            ),
          ),
        ),
      ],
    );
  }
}
