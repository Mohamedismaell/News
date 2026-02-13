import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/shared/presentation/widget/stacked_image.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/book_marks/presentation/manager/cubit/book_marks_cubit.dart';

class BookmarksPosts extends StatelessWidget {
  const BookmarksPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarksCubit, BookMarksState>(
      builder: (context, state) {
        //TODO: Empty refactor thew state condition
        return state.bookmarks.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
                  child: SizedBox(
                    width: 270.w,
                    // height: 265,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.purpleLighter),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Icon(
                              Icons.library_books_outlined,
                              color: AppColors.purplePrimary,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          textAlign: TextAlign.center,
                          'You haven\'t saved any articles yet. Start reading and bookmarking them now',
                          style: AppTextStyles.textMedium,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.bookmarks.length,
                itemBuilder: (context, index) {
                  final post = state.bookmarks[index].post;
                  final category = state.bookmarks[index].category;
                  // final isBookmarked = state.isBookmarked(post.id);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: StackedImage(
                      // imageWidth: double.infinity,
                      post: post,
                      category: category,
                      imageHeight: 255,
                      textContainerWidth: 0.8,
                      routeName: AppRoutes.bookmarks,
                      heroType: 'bookMarks_$index',
                    ),
                  );
                },
              );
      },
    );
  }
}
