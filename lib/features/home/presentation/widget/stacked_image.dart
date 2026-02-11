import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/core/shared/widget/app_cached_image.dart';
import 'package:news_app/features/home/domain/entities/post_entitiy.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/news/category_news_cubit.dart';

class StackedImage extends StatelessWidget {
  const StackedImage(
      {super.key,
      required this.post,
      this.category,
      required this.isBookmarked,
      required this.imageHeight,
      this.imageWidth,
      required this.textContainerWidth});
  final PostEntity post;
  final String? category;
  final bool isBookmarked;
  final double imageHeight;
  final double? imageWidth;
  final double textContainerWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          'postDetails',
          pathParameters: {
            'postId': post.id.toString(),
          },
          extra: {
            'heroTag': 'post_${post.id}',
            'coverUrl': post.imageUrl,
            'title': post.title,
            'author': post.author,
            'isBookmarked': isBookmarked,
          },
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            //! image
            Hero(
              tag: 'post_${post.id}',
              child: AppCachedImage(
                imageUrl: post.imageUrl ?? '',
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0.7),
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            // ! Saved icon
            Positioned(
              top: 24,
              right: 24,
              child: IconButton(
                  onPressed: () => context
                      .read<CategoryNewsCubit>()
                      .toggleBookmark(post, category: category),
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: AppColors.white,
                    size: 24.sp,
                  )),
            ),
            // ! category + title
            Padding(
              padding: EdgeInsets.all(24.r),
              child: SizedBox(
                width: imageWidth! - (24 * 2).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(category ?? post.author,
                        style: context.textTheme.labelMedium),
                    SizedBox(height: 8.h),
                    Text(
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        post.title.toString(),
                        style: context.textTheme.labelMedium),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
