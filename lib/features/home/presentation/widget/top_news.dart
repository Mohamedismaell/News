import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/presentation/widget/app_cached_image.dart';
import 'package:news_app/core/shared/presentation/widget/top_news_skeltonizer.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/book_marks/presentation/manager/cubit/book_marks_cubit.dart';
import 'package:news_app/features/home/presentation/manager/top_head_lines.dart/top_head_lines_cubit.dart';

class TopNewsSection extends StatelessWidget {
  const TopNewsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TopHeadLinesCubit>()..init(),
      child: BlocBuilder<TopHeadLinesCubit, TopHeadLinesState>(
        builder: (context, state) {
          if (state.topNewsStatus == NewsStatus.loading) {
            return TopNewsSkeltonizer();
          }

          if (state.topNewsStatus == NewsStatus.error) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(state.errorMessage ?? 'Error'),
              ),
            );
          }
          if (state.topHeadLines.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(child: Text('No news available')),
            );
          }
          return SliverList.builder(
            itemCount: state.topHeadLines.length,
            itemBuilder: (context, index) {
              final post = state.topHeadLines[index];
              return Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(
                      'postDetails',
                      pathParameters: {
                        'postId': post.id.toString(),
                      },
                      extra: {
                        'heroTag': 'post_${index}_${post.id}',
                        'coverUrl': post.imageUrl,
                        'title': post.title,
                        'author': post.author,
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      height: 96.h,
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [],
                            ),
                            child: Hero(
                              tag: 'post_${index}_${post.id}',
                              child: AppCachedImage(
                                  imageUrl: post.imageUrl.toString(),
                                  width: 96.w,
                                  height: 96.h,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          post.author.split(',').first,
                                          style: context.textTheme.bodyMedium),
                                    ),
                                    BlocBuilder<BookMarksCubit, BookMarksState>(
                                      builder: (context, state) {
                                        return IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            visualDensity:
                                                VisualDensity.compact,
                                            onPressed: () => context
                                                .read<BookMarksCubit>()
                                                .toggleBookmark(
                                                  post: post,
                                                ),
                                            icon: Icon(
                                              state.isBookmarked(post.id)
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_border,
                                              color: context.colorTheme.primary,
                                              size: 18.sp,
                                            ));
                                      },
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: true,
                                      post.title,
                                      style: context.textTheme.bodySmall!
                                          .copyWith(
                                              fontSize: 14.sp,
                                              color: AppColors.blackPrimary)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
