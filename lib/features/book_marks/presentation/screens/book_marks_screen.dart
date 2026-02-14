import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/book_marks/presentation/widget/book_marks_header.dart';
import 'package:news_app/features/book_marks/presentation/widget/makred_posts.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BookmarksBody();
  }
}

class _BookmarksBody extends StatelessWidget {
  const _BookmarksBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: ListView(
        children: [
          const BookmarksHeader(),
          SizedBox(height: 32.h),
          const BookmarksPosts(),
        ],
      ),
    );
  }
}
