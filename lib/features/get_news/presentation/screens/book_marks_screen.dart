import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/news/news_cubit.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
      child: ListView(
        children: [
          const _BookmarksHeader(),
          SizedBox(height: 32),
          const _BookmarksPosts(),
        ],
      ),
    );
  }
}

class _BookmarksHeader extends StatelessWidget {
  const _BookmarksHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bookmarks',
            style: AppTextStyles.headlLineLarge
                .copyWith(color: context.customColors.secondaryColor)),
        SizedBox(height: 8),
        Text('Saved articles to the library',
            style: AppTextStyles.hintTextlarge),
      ],
    );
  }
}

class _BookmarksPosts extends StatelessWidget {
  const _BookmarksPosts();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        //TODO: Empty refactor thew state condition
        return state.bookmarks == null || state.bookmarks!.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Center(
                  child: SizedBox(
                    width: 270,
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
                        SizedBox(height: 24),
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.bookmarks!.length,
                itemBuilder: (context, index) {
                  final post = state.bookmarks![index].post;
                  final category = state.bookmarks![index].category;
                  final isBookmarked = state.isBookmarked(post.id);
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SizedBox()
                      // StackedImage(
                      //   post: post,
                      //   category: category,
                      //   isBookmarked: isBookmarked,
                      //   imageHeight: 255,
                      //   textContainerWidth: 0.8,
                      // ),
                      );
                },
              );
      },
    );
  }
}
