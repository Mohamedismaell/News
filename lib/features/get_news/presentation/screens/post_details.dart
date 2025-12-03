import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/get_news/presentation/widget/post_details_appbar.dart';
import 'package:news_app/utility.dart';
import '../../domain/entities/post_entitiy.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, required this.post, required this.category});
  final PostEntity post;
  final String category;
  @override
  Widget build(BuildContext context) {
    return _PostDetailsBody(
      post: post,
      category: category,
    );
  }
}

class _PostDetailsBody extends StatelessWidget {
  const _PostDetailsBody({required this.post, required this.category});
  final PostEntity post;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          PostDetailsAppbar(
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
              style: AppTextStyles.headlLineMedium
                  .copyWith(color: context.customColors.secondaryColor),
            ),
            addVertical(20),
            Text(
              post.threadtitle,
              style: AppTextStyles.textRegular.copyWith(fontSize: 20),
            ),
            addVertical(20),
            Text(
              post.threadText,
              style: AppTextStyles.textRegular.copyWith(fontSize: 18),
            ),
            //* Edite here
            // addVertical(20),
            const SizedBox(height: 1000),
          ],
        ),
      ),
    );
  }
}
