import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/shared/presentation/manager/news/category_news_cubit.dart';
import 'package:news_app/core/shared/presentation/widget/post_categories_skeltonizer.dart';
import 'package:news_app/core/shared/presentation/widget/stacked_image.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});
  final NewsCategory category;
  @override
  Widget build(BuildContext context) {
    final categoryValue = category.value.split(',').first.trim();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CategoryHeader(
            category: categoryValue,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          _Posts(category: categoryValue)
        ],
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
          Text(category, style: context.textTheme.headlineLarge),
        ],
      ),
    );
  }
}

class _Posts extends StatelessWidget {
  const _Posts({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsCubit, NewsState>(builder: (context, state) {
      final Widget content = SliverList.builder(
        itemCount: state.categoryNews.length,
        itemBuilder: (context, index) {
          final post = state.categoryNews[index];
          final isBookmarked = state.isBookmarked(post.id);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                StackedImage(
                    routeName: AppRoutes.categories,
                    heroType: 'category_$index',
                    post: post,
                    category: category,
                    isBookmarked: isBookmarked,
                    imageWidth: double.infinity,
                    imageHeight: 260.h,
                    textContainerWidth: 0.8),
                SizedBox(height: 20.h)
              ],
            ),
          );
        },
      );
      return switch (state.categoryStatus) {
        NewsStatus.loading => PostCategoriesSkeltonizer(),
        NewsStatus.loaded => content,
        _ => SliverToBoxAdapter(child: SizedBox.shrink())
      };
    });
  }
}
