import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/get_news/presentation/cubit/post_/post_details_cubit.dart';
import 'package:news_app/features/get_news/presentation/widget/post_details_appbar.dart';
import '../../domain/entities/post_entitiy.dart';

class PostDetails extends StatefulWidget {
  const PostDetails(
      {super.key,
      required this.heroTag,
      required this.previewCover,
      required this.previewTitle,
      required this.previewAuthor,
      required this.isBookmarked});
  final String heroTag;
  final String previewCover;
  final String previewTitle;
  final String previewAuthor;
  final bool isBookmarked;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  void initState() {
    print('CoverImage url from the route ***');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
          print('CoverImage url inside the Builder${widget.previewCover} ***');
          // final post = state is PostDetailsLoaded ? state.post : null;
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              PostDetailsAppbar(
                imageUrl: widget.previewCover,
                author: widget.previewAuthor,
                title: widget.previewTitle,
                heroTag: widget.heroTag,
                isBookmarked: widget.isBookmarked,
              ),
              if (state is PostDetailsLoaded) _BottomBar(post: state.post),
            ],
          );
          // return const SizedBox();
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
            Text('Description',
                style: context.textTheme.labelLarge!
                    .copyWith(color: AppColors.blackPrimary)),
            SizedBox(height: 8.h),
            Text(
              post.description,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColors.greyDarker),
            ),
            SizedBox(height: 16.h),
            Text('Content',
                style: context.textTheme.labelLarge!
                    .copyWith(color: AppColors.blackPrimary)),
            SizedBox(height: 8.h),
            Text(
              post.content,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: AppColors.greyDarker),
            ),
            SizedBox(height: 16.h),
            RichText(
              text: TextSpan(
                text: 'For more details vist. ',
                style: context.textTheme.bodyMedium!
                    .copyWith(color: AppColors.greyDarker),
                children: [
                  TextSpan(
                    text: post.postUrl,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Todo Handle Navigation Url
                        print('tapped');
                      },
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: AppColors.purplePrimary),
                  ),
                ],
              ),
            ),

            //* Edite here
            // SizedBox(height:20),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

// For more detailed state results click on the States A-Z links
//  at the bottom of this page. Results source: NEP/Edison via Reuters.
