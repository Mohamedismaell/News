import 'package:news_app/core/shared/data/models/news_response_dto.dart';

abstract class HomeDataSource {
  NewsResponseDto? getTopHeadlinesNews();
  Future<void> saveTopHeadlinesNews(NewsResponseDto value);
}
