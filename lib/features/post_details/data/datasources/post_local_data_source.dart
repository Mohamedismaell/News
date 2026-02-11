import 'package:news_app/features/post_details/data/datasources/post_data_source.dart';

class PostLocalDataSource implements PostDataSource {
  // final Box<NewsResponseDto> newsBox;

  // String _categoryKey(String category) => 'category_$category';

  // postLocalDataSource({required this.newsBox});

  // @override
  // NewsResponseDto? getCategoryNews(String category) {
  //   return newsBox.get(_categoryKey(category));
  // }

  // @override
  // NewsResponseDto? getTopHeadlinesNews() {
  //   return newsBox.get('top_headlines');
  // }

  // @override
  // Future<void> saveCategoryNews(String category, NewsResponseDto value) async {
  //   await newsBox.put(_categoryKey(category), value);
  // }

  // @override
  // Future<void> saveTopHeadlinesNews(NewsResponseDto value) async {
  //   await newsBox.put('top_headlines', value);
  // }
}
