import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/core/widget/app_cached_image.dart';
import 'package:news_app/core/widget/top_news_skeltonizer.dart';
import '../cubit/news/news_cubit.dart';

class TopNewsSection extends StatelessWidget {
  const TopNewsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state.dateStatus == NewsStatus.loading) {
          return TopNewsSkeltonizer();
        }

        if (state.dateStatus == NewsStatus.error) {
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
            final isBookmarked = state.isBookmarked(post.id);
            return InkWell(
              onTap: () {
                print('Tapped');
                if (post.id.isNotEmpty) {
                  try {
                    context.push('/testScreen');
                    // context.pushNamed(
                    //   'postDetails',
                    //   pathParameters: {
                    //     'postId': post.id.toString(),
                    //   },
                    //   extra: {
                    //     'heroTag': 'post_${post.id}',
                    //     'coverUrl': post.threadimageUrl,
                    //     'title': post.threadtitle,
                    //     'author': post.author,
                    //   },
                    // );
                  } catch (e) {
                    print('Navigation Error: $e');
                  }
                } else {
                  print('Error: Post ID is empty');
                }
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
                        child: AppCachedImage(
                            imageUrl: post.threadimageUrl.toString(),
                            width: 96.w,
                            height: 96.h,
                            fit: BoxFit.cover),
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
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () => context
                                        .read<NewsCubit>()
                                        .toggleBookmark(
                                          post,
                                        ),
                                    icon: Icon(
                                      isBookmarked
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: context.colorTheme.primary,
                                      size: 18.sp,
                                    )),
                              ],
                            ),
                            Expanded(
                              child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                  post.threadtitle,
                                  style: context.textTheme.bodySmall!.copyWith(
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
            );
          },
        );
      },
    );
  }
}
