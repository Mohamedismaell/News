import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopNewsSkeltonizer extends StatelessWidget {
  TopNewsSkeltonizer({super.key});

  final posts = List.filled(
      10,
      PostEntity(
        description: 'thereadurlthereadurl',
        id: 'id',
        thereadurl: 'thereadurlthereadurl',
        title: 'threadimageUrlthreadimageUrlthreadimage',
        imageUrl: 'threadimageUrlthreadimageUrlthreadimageUrlthreadimageUrl',
        categories: ['categories'],
        author: 'jhone maikky',
        publishedAt: '12/12/2000',
        content: '',
        postUrl: '',
      ));
  @override
  Widget build(BuildContext context) {
    return SliverSkeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
      child: SliverList.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
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
                        ),
                        child: Container(
                          width: 96.w,
                          height: 96.h,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: SizedBox(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Expanded(
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  post.author.split(',').first,
                                ),
                              ),
                              Skeleton.shade(
                                child: Icon(
                                  Icons.bookmark,
                                  size: 18.sp,
                                ),
                              )
                            ]),
                            Expanded(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                softWrap: true,
                                post.title,
                              ),
                            )
                          ],
                        )),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
