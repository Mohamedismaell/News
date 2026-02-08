import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
          return Center(child: CircularProgressIndicator());
        }

        if (state.dateStatus == NewsStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Error'),
          );
        }
        if (state.newsByDate == null || state.newsByDate!.isEmpty) {
          return Center(child: Text('No news available'));
        }
        return SliverList.builder(
          itemCount: state.newsByDate!.length,
          itemBuilder: (context, index) {
            final post = state.newsByDate![index];
            final isBookmarked = state.isBookmarked(post.id);
            return SliverToBoxAdapter(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async => await context.push(
                      AppRoutes.newsDetails,
                      extra: NewsDetailsArgs(
                          post: post, category: post.categories.first),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: CachedNetworkImage(
                            imageUrl: post.threadimageUrl.toString(),
                            width: 140.w,
                            height: 140.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                'assets/images/OIP.webp',
                                width: 140.w,
                                height: 140.h,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //       vertical: 10,
                        //     ),
                        //     child: SizedBox(
                        //       child: Builder(
                        //         builder: (context) => Column(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 //* Author
                        //                 Text(
                        //                     maxLines: 1,
                        //                     post.author.split(',').first,
                        //                     style: AppTextStyles.headlLineMedium
                        //                         .copyWith(
                        //                             color: context.customColors
                        //                                 .secondaryColor)),
                        //                 Spacer(),
                        //                 //* Saved icon
                        //                 IconButton(
                        //                     onPressed: () => context
                        //                         .read<NewsCubit>()
                        //                         .toggleBookmark(
                        //                           post,
                        //                         ),
                        //                     icon: Icon(
                        //                       isBookmarked
                        //                           ? Icons.bookmark
                        //                           : Icons.bookmark_border,
                        //                       color: AppColors.purplePrimary,
                        //                       size: 30,
                        //                     )),
                        //               ],
                        //             ),
                        //             SizedBox(height: 15.h),
                        //             //
                        //             Text(
                        //               maxLines: 3,
                        //               overflow: TextOverflow.ellipsis,
                        //               post.threadtitle,
                        //               style: AppTextStyles.headlLineSmall
                        //                   .copyWith(
                        //                       color: context
                        //                           .customColors.secondaryColor),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
