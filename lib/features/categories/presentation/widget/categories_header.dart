import 'package:flutter/material.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({super.key});

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
            Text('Categories', style: context.textTheme.headlineLarge),
            SizedBox(height: 8),
            Text('Thousands of articles in each category',
                style: context.textTheme.bodyMedium),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
