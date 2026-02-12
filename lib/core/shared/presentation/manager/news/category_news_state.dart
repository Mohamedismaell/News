part of 'category_news_cubit.dart';

@immutable
class NewsState extends Equatable {
  final String selectedCategory;
  final NewsStatus categoryStatus;
  final List<PostEntity> categoryNews;
  final List<BookmarkedPost>? bookmarks;
  final String? errorMessage;
  const NewsState({
    this.categoryStatus = NewsStatus.loading,
    this.selectedCategory = 'Politics',
    this.categoryNews = const [],
    this.errorMessage,
    this.bookmarks,
  });

  NewsState copyWith({
    String? selectedCategory,
    NewsStatus? categoryStatus,
    List<PostEntity>? categoryNews,
    List<BookmarkedPost>? bookmarks,
    String? errorMessage,
  }) {
    return NewsState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      categoryNews: categoryNews ?? this.categoryNews,
      bookmarks: bookmarks ?? this.bookmarks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool isBookmarked(String postId) {
    return bookmarks?.any((markedPost) => markedPost.post.id == postId) ??
        false;
  }

  // @override
  // String toString() {
  // }

  @override
  List<Object?> get props =>
      [selectedCategory, categoryStatus, categoryNews, bookmarks, errorMessage];
}
