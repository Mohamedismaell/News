import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryNewsSkeltonizer extends StatelessWidget {
  CategoryNewsSkeltonizer({super.key});

  final posts = List.filled(
      10,
      PostEntity(
          threadText: 'thereadurlthereadurl',
          id: 'id',
          thereadurl: 'thereadurlthereadurl',
          threadtitle: 'threadimageUrlthreadimageUrlthreadimage',
          threadimageUrl:
              'threadimageUrlthreadimageUrlthreadimageUrlthreadimageUrl',
          categories: ['categories'],
          author: 'jhone maikky'));
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        width: 256.w,
        height: 256.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            final category = 'category';
            final isBookmarked = false;
            return Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 200.w,
                      height: 256.h,
                      color: Colors.grey,
                    )),
                SizedBox(width: 15.w),
              ],
            );
          },
        ),
      ),
    );
  }
}
