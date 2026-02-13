import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/presentation/widget/app_cached_image.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/book_marks/presentation/manager/cubit/book_marks_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostDetailsAppbar extends StatelessWidget {
  const PostDetailsAppbar({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.heroTag,
    this.post,
  });

  final String imageUrl;
  final String title;
  final String author;
  final String heroTag;
  final PostEntity? post;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actionsIconTheme: IconThemeData(color: AppColors.white),
      expandedHeight: 384.h,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Hero(
          tag: heroTag,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //! image
              Opacity(
                opacity: 0.9,
                child: AppCachedImage(
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                ),
              ),
              //! Grdiant
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
              //! buttons
              Positioned(
                top: 80.h,
                right: 10.w,
                child: Column(
                  children: [
                    BlocBuilder<BookMarksCubit, BookMarksState>(
                      builder: (context, state) {
                        if (post == null) {
                          return Skeleton.shade(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_border,
                                size: 24.sp,
                                color: AppColors.white,
                              ),
                            ),
                          );
                        }
                        final isBookmarked = state.isBookmarked(post!.id);
                        return IconButton(
                          icon: Icon(
                            isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: AppColors.white,
                            size: 24.sp,
                          ),
                          onPressed: () => context
                              .read<BookMarksCubit>()
                              .toggleBookmark(post: post!),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.ios_share_outlined,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              //! category + Author
              Positioned(
                bottom: 54.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width - (24 * 2).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 16.w),
                          ),
                          child: Text(author,
                              style: context.textTheme.labelMedium!.copyWith(
                                  color: context.colorTheme.onPrimary)),
                        ),
                        SizedBox(height: 8.h),
                        Text(title,
                            style: context.textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colorTheme.onPrimary)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: Container(
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.customColors.bottomAppbar,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              topRight: Radius.circular(32.r),
            ),
          ),
          child: Container(
            width: 100.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(32.r),
            ),
          ),
        ),
      ),
    );
  }
}
