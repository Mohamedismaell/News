import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/templete/data/datasources/news_category.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/templete/presentation/widget/stacked_image.dart';
import 'package:news_app/utility.dart';
import '../../../../core/theme/app_text_styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});
  final NewsCategory category;
  @override
  Widget build(BuildContext context) {
    final categoryValue =
        category.value.split(',').first.trim();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            _CategoryHeader(
              category: categoryValue,
            ),
            addVertical(10),
            _Posts(category: categoryValue)
          ],
        ),
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back)),
        Text(category,
            style: AppTextStyles.headlLineMedium),
      ],
    );
  }
}

class _Posts extends StatelessWidget {
  const _Posts({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
      final Widget content = ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.newsByCategory!.length,
        itemBuilder: (context, index) {
          final post = state.newsByCategory![index];
          final isBookmarked = state.isBookmarked(post.id);
          return Column(
            children: [
              StackedImage(
                  post: post,
                  category: category,
                  isBookmarked: isBookmarked,
                  imageHeight: 260,
                  textContainerWidth: 0.8),
              addVertical(15)
            ],
          );
        },
      );
      return switch (state.categoryStatus) {
        NewsStatus.loading =>
          Center(child: CircularProgressIndicator()),
        NewsStatus.loaded => Center(child: content),
        _ => const SizedBox.shrink()
      };
    });
  }
}
