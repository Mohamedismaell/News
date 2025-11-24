part of 'news_cubit.dart';

@immutable
class NewsState {
  final String selectedCategory;
  final NewsStatus categoryStatus;
  final NewsStatus dateStatus;
  final List<PostEntity>? newsByCategory;
  final List<PostEntity>? newsByDate;
  final List<BookmarkedPost>? bookmarks;
  final String? errorMessage;
  const NewsState({
    this.selectedCategory = 'Politics',
    this.categoryStatus = NewsStatus.initial,
    this.dateStatus = NewsStatus.initial,
    this.newsByCategory,
    this.newsByDate,
    this.errorMessage,
    this.bookmarks,
  });

  NewsState copyWith({
    String? selectedCategory,
    NewsStatus? categoryStatus,
    NewsStatus? dateStatus,
    List<PostEntity>? newsByCategory,
    List<PostEntity>? newsByDate,
    List<BookmarkedPost>? bookmarks,
    String? errorMessage,
  }) {
    return NewsState(
      selectedCategory:
          selectedCategory ?? this.selectedCategory,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      dateStatus: dateStatus ?? this.dateStatus,
      newsByCategory: newsByCategory ?? this.newsByCategory,
      newsByDate: newsByDate ?? this.newsByDate,
      bookmarks: bookmarks ?? this.bookmarks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool isBookmarked(String postId) {
    return bookmarks?.any(
            (markedPost) => markedPost.post.id == postId) ??
        false;
  }
}

enum NewsStatus { initial, loading, loaded, error }
