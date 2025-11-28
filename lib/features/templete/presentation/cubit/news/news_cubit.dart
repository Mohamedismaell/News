import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/params/params.dart';
import 'package:news_app/features/templete/domain/usecases/get_news.dart';
import '../../../domain/entities/post_entitiy.dart';
import '../../model/Book_marked_post.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.getNews) : super(NewsState()) {
    init();
  }
  final GetNewsByCategory getNews;
  bool _isloaded = false;
  int _categoryRequestId = 0; // ✅ Track category requests
  int _dateRequestId = 0; // ✅ Track date requests

  Future<void> eitherFailureOrSuccessByCategory(
    String category,
  ) async {
    // ✅ Increment and capture current request ID
    final requestId = ++_categoryRequestId;
    print(
        '🔵 Category request #$requestId started: $category');

    emit(state.copyWith(
      categoryStatus: NewsStatus.loading,
      newsByCategory: [],
      selectedCategory: category,
    ));
    final response = await getNews.callNewsCategory(
      params: NewsCategoryParams(category: category),
    );

    if (requestId != _categoryRequestId) {
      print(
          '⏭️ Ignoring outdated category request #$requestId for: $category');
      return;
    }

    print(
        '✅ Processing latest category request #$requestId: $category');

    response.when(
      success: (newsApi) {
        if (requestId != _categoryRequestId) return;

        final validateNewsCategory = newsApi.where((post) {
          return post.threadimageUrl != null &&
              post.threadimageUrl!.isNotEmpty &&
              Uri.tryParse(
                    post.threadimageUrl!,
                  )?.hasAbsolutePath ==
                  true;
        }).toList();
        emit(
          state.copyWith(
            categoryStatus: NewsStatus.loaded,
            newsByCategory: validateNewsCategory,
          ),
        );
      },
      failure: (errorMessage) {
        emit(
          state.copyWith(
            categoryStatus: NewsStatus.error,
            errorMessage: errorMessage.errMessage,
          ),
        );
      },
    );
  }

  Future<void> eitherFailureOrSuccessByDate() async {
    final response = await getNews.callNewsDate();
    return response.when(
      success: (news) {
        final validateNewsDate = news.where((post) {
          return post.threadimageUrl != null &&
              post.threadimageUrl!.isNotEmpty &&
              Uri.tryParse(
                    post.threadimageUrl!,
                  )?.hasAbsolutePath ==
                  true;
        }).toList();
        emit(
          state.copyWith(
            dateStatus: NewsStatus.loaded,
            newsByDate: validateNewsDate,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            dateStatus: NewsStatus.error,
            errorMessage: error.errMessage,
          ),
        );
      },
    );
  }

  Future<void> init() async {
    if (_isloaded) {
      print('✅ Already initialized, skipping');
      return;
    }

    print('🔄 Initializing NewsCubit...');
    _isloaded = true;

    emit(state.copyWith(
      categoryStatus: NewsStatus.loading,
      dateStatus: NewsStatus.loading,
    ));

    try {
      await eitherFailureOrSuccessByCategory(
          EndPoints.defaultCategory);
      await eitherFailureOrSuccessByDate();
      print('✅ NewsCubit initialized successfully');
    } catch (e) {
      print('❌ NewsCubit initialization failed: $e');
      _isloaded = false;
    }
  }

  //* wait for it now

  // void init() {
  //   if (_isloaded) return;
  //   fetchInitial(_isloaded);

  // }

  // Future<void> fetchInitial(bool isloaded) async {
  //   if (!isloaded) {
  //     emit(
  //       state.copyWith(
  //         categoryStatus: NewsStatus.loading,
  //         dateStatus: NewsStatus.loading,
  //       ),
  //     );
  //     await eitherFailureOrSuccessByCategory(
  //       EndPoints.defaultCategory,
  //     );
  //     await eitherFailureOrSuccessByDate();
  //     _isloaded = true;
  //   }
  // }

  void selectCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
    eitherFailureOrSuccessByCategory(category);
  }

  void toggleBookmark(PostEntity post, {String? category}) {
    final currentBookmarks =
        List<BookmarkedPost>.from(state.bookmarks ?? []);
    final index = currentBookmarks.indexWhere(
      (bookmark) => bookmark.post.id == post.id,
    );

    if (index != -1) {
      currentBookmarks.removeAt(index);
    } else {
      currentBookmarks.add(
          BookmarkedPost(post: post, category: category));
    }

    emit(state.copyWith(bookmarks: currentBookmarks));
    debugPrint(
        'Total bookmarks: ${currentBookmarks.length}');
  }
}
