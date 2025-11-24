import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/templete/presentation/widget/news_details_appbar.dart';
import 'package:news_app/utility.dart';
import '../../domain/entities/post_entitiy.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen(
      {super.key,
      required this.post,
      required this.category});
  final PostEntity post;
  final String category;
  @override
  Widget build(BuildContext context) {
    return _NewsDetailsBody(
      post: post,
      category: category,
    );
  }
}

class _NewsDetailsBody extends StatelessWidget {
  const _NewsDetailsBody(
      {required this.post, required this.category});
  final PostEntity post;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewsDetailsAppBar(
            imageUrl: post.threadimageUrl!,
            category: category,
            author: post.author,
          ),
          _BottomBar(post: post),
        ],
      ),
    );
  }
}

// Title - text - url
class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.post});
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Results',
              style: AppTextStyles.headlLineMedium,
            ),
            addVertical(20),
            Text(
              post.threadtitle,
              style: AppTextStyles.textRegular
                  .copyWith(fontSize: 20),
            ),
            addVertical(20),
            Text(
              post.threadText,
              style: AppTextStyles.textRegular
                  .copyWith(fontSize: 18),
            ),
            addVertical(20),
            const SizedBox(height: 1000),
          ],
        ),
      ),
    );
  }
}
