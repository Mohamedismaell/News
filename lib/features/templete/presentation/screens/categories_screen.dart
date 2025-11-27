import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/templete/data/datasources/news_category.dart';
import 'package:news_app/utility.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CategoriesBody();
  }
}

class _CategoriesBody extends StatelessWidget {
  const _CategoriesBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const _CategoryHeader(),
            const _CategoriesButton(),
          ],
        ),
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories',
                style: AppTextStyles.headlLineLarge),
            addVertical(8),
            Text('Thousands of articles in each category',
                style: AppTextStyles.hintTextlarge),
            addVertical(16)
          ],
        ),
      ),
    );
  }
}

class _CategoriesButton extends StatelessWidget {
  const _CategoriesButton();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      sliver: SliverGrid(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.9,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: NewsCategory.values.length,
          (context, index) {
            final category = NewsCategory.values[index];
            //     !.split(',')
            //     .first
            //     .trim();

            return InkWell(
              onTap: () {
                context.push(AppRoutes.categoryScreen,
                    extra: category.value
                        .split(',')
                        .first
                        .trim());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F3F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    '${category.emoji} ${category.value.split(',').first.trim()}',
                    style:
                        AppTextStyles.textSemibold.copyWith(
                      color: AppColors.greyDarker,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
