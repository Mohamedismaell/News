part of 'news_cubit.dart';

@immutable
class NewsState extends Equatable {
  final String selectedCategory;
  final NewsStatus categoryStatus;
  final NewsStatus dateStatus;
  final List<PostEntity> categoryNews;
  final List<PostEntity> topHeadLines;
  final List<BookmarkedPost>? bookmarks;
  final String? errorMessage;
  const NewsState({
    this.dateStatus = NewsStatus.loading,
    this.categoryStatus = NewsStatus.loading,
    this.selectedCategory = 'Politics',
    this.categoryNews = const [],
    this.topHeadLines = const [],
    this.errorMessage,
    this.bookmarks,
  });

  NewsState copyWith({
    String? selectedCategory,
    NewsStatus? categoryStatus,
    NewsStatus? dateStatus,
    List<PostEntity>? categoryNews,
    List<PostEntity>? topHeadLines,
    List<BookmarkedPost>? bookmarks,
    String? errorMessage,
  }) {
    return NewsState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      dateStatus: dateStatus ?? this.dateStatus,
      categoryNews: categoryNews ?? this.categoryNews,
      topHeadLines: topHeadLines ?? this.topHeadLines,
      bookmarks: bookmarks ?? this.bookmarks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool isBookmarked(String postId) {
    return bookmarks?.any((markedPost) => markedPost.post.id == postId) ??
        false;
  }

  @override
  String toString() {
    return 'NewsState(selectedCategory: $selectedCategory, categoryStatus: $categoryStatus, dateStatus: $dateStatus, categoryNews: $categoryNews, topHeadLines: $topHeadLines, bookmarks: $bookmarks, errorMessage: $errorMessage)';
  }

  @override
  List<Object?> get props => [
        selectedCategory,
        categoryStatus,
        dateStatus,
        categoryNews,
        topHeadLines,
        bookmarks,
        errorMessage
      ];
}
