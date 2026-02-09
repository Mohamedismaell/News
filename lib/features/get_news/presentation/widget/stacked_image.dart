import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/core/widget/app_cached_image.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/news/news_cubit.dart';
import '../model/news_detail_args.dart';

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
    return GestureDetector(
      // onTap: () async {
      //   await context.push(AppRoutes.newsDetails,
      //       extra:
      //           NewsDetailsArgs(post: post, category: post.categories.first));
      // },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            //! image
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: AppCachedImage(
                imageUrl: post.threadimageUrl ?? '',
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
            //! linear gradiant
            Container(
              height: imageHeight,
              width: imageWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    // Color(0xFF22242F).withOpacity(0.8),
                    Color.fromARGB(255, 0, 0, 0),
                    Color(0x0022242F).withOpacity(0.48),
                  ],
                ),
              ),
            ),
            //! Saved icon
            Positioned(
              top: 24,
              right: 24,
              child: IconButton(
                  onPressed: () => context
                      .read<NewsCubit>()
                      .toggleBookmark(post, category: category),
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: AppColors.white,
                    size: 30.r,
                  )),
            ),
            //! category + title
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
                        post.threadtitle.toString(),
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
