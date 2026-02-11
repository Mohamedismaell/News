import 'package:news_app/features/home/data/models/news_response_dto.dart';

abstract class NewsDataSource {
  NewsResponseDto? getCategoryNews(String category);
  Future<void> saveCategoryNews(String category, NewsResponseDto value);
  NewsResponseDto? getTopHeadlinesNews();
  Future<void> saveTopHeadlinesNews(NewsResponseDto value);
}
