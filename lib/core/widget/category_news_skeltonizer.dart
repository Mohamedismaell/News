import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryNewsSkeltonizer extends StatelessWidget {
  CategoryNewsSkeltonizer({super.key});

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
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
      child: SizedBox(
        width: 256.w,
        height: 256.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            final category = 'category';
            return Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      //! Saved icon
                      Positioned(
                          top: 24,
                          right: 24,
                          child: Skeleton.shade(
                            child: Icon(
                              Icons.bookmark_border,
                              size: 30.r,
                            ),
                          )),
                      //! category + title
                      Padding(
                        padding: EdgeInsets.all(24.r),
                        child: SizedBox(
                          width: 230.w - (24 * 2).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                category,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                maxLines: 2,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                post.title.toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
