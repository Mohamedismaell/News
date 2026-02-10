import 'package:news_app/features/get_news/data/models/news_response_dto.dart';

abstract class NewsDataSource {
  NewsResponseDto? getCategoryNews(String category);
  Future<void> saveCategoryNews(String category, NewsResponseDto value);
  NewsResponseDto? getTopHeadlinesNews();
  Future<void> saveTopHeadlinesNews(NewsResponseDto value);
}
