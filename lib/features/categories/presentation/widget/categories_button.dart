import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.9,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: NewsCategory.values.length,
          (context, index) {
            final category = NewsCategory.values[index];
            return InkWell(
              onTap: () {
                context.push(AppRoutes.categoryScreen,
                    extra: {'category': category});
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
                    style: AppTextStyles.textSemibold.copyWith(
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
