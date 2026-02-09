import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/get_news/presentation/cubit/post_/post_details_cubit.dart';
import '../../domain/entities/post_entitiy.dart';

class PostDetails extends StatelessWidget {
  const PostDetails(
      {super.key,
      required this.heroTag,
      required this.previewCover,
      required this.previewTitle,
      required this.previewAuthor});
  final String heroTag;
  final String previewCover;
  final String previewTitle;
  final String previewAuthor;

  @override
  Widget build(BuildContext context) {
    return _PostDetailsBody(
      heroTag: heroTag,
    );
  }
}

class _PostDetailsBody extends StatelessWidget {
  const _PostDetailsBody({required this.heroTag});
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
          // context.read<NewsCubit>().callNewsCategory(postId);
          if (state is PostDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostDetailsError) {
            return Text(state.errorMessage);
          }
          if (state is PostDetailsLoaded) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // PostDetailsAppbar(
                //   imageUrl: post.threadimageUrl!,
                //   category: category,
                //   author: post.author,
                // ),
                // _BottomBar(post: post),
              ],
            );
          }

          return const SizedBox();
        },
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
            SizedBox(height: 20),
            Text(
              post.threadtitle,
              style: AppTextStyles.textRegular.copyWith(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              post.threadText,
              style: AppTextStyles.textRegular.copyWith(fontSize: 18),
            ),
            //* Edite here
            // SizedBox(height:20),
            const SizedBox(height: 1000),
          ],
        ),
      ),
    );
  }
}
