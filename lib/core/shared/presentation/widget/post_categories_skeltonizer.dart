import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostCategoriesSkeltonizer extends StatelessWidget {
  PostCategoriesSkeltonizer({super.key});
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
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: posts.length,
      (context, index) {
        final post = posts[index];
        final category = 'category';
        return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Container(
                width: double.infinity,
                height: 260.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Colors.grey.shade200,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
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
                        width: 240.w - (24 * 2).r,
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
            ));
      },
    ));
  }
}
