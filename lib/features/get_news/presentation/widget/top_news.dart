import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/enums/stats.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/core/widget/app_cached_image.dart';
import 'package:news_app/core/widget/top_news_skeltonizer.dart';

import '../../../../core/routes/app_routes.dart';
import '../cubit/news/news_cubit.dart';
import '../model/news_detail_args.dart';

class TopNewsSection extends StatelessWidget {
  const TopNewsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        debugPrint(
          "🧠 NewsByDate count: ${state.newsByDate?.length}",
        );

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
        if (state.newsByDate == null || state.newsByDate!.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(child: Text('No news available')),
          );
        }
        return SliverList.builder(
          itemCount: state.newsByDate!.length,
          itemBuilder: (context, index) {
            final post = state.newsByDate![index];
            final isBookmarked = state.isBookmarked(post.id);
            return Padding(
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
                      child: GestureDetector(
                          // onTap: () async => await context.push(
                          //       AppRoutes.newsDetails,
                          //       extra: NewsDetailsArgs(
                          //           post: post,
                          //           category: post.categories.first),
                          //     ),
                          child: AppCachedImage(
                              imageUrl: post.threadimageUrl.toString(),
                              width: 96.w,
                              height: 96.h,
                              fit: BoxFit.cover)),
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
                                  onPressed: () =>
                                      context.read<NewsCubit>().toggleBookmark(
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
            );
          },
        );
      },
    );
  }
}
