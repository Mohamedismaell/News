import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

class BookmarksHeader extends StatelessWidget {
  const BookmarksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bookmarks', style: context.textTheme.headlineLarge),
        SizedBox(height: 8.h),
        Text('Saved articles to the library',
            style: context.textTheme.bodyMedium),
      ],
    );
  }
}
