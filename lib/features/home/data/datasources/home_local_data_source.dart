import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';
import 'package:news_app/features/home/data/datasources/home_data_source.dart';

class HomeLocalDataSource implements HomeDataSource {
  final Box<NewsResponseDto> newsBox;

  HomeLocalDataSource({required this.newsBox});

  @override
  NewsResponseDto? getTopHeadlinesNews() {
    return newsBox.get('top_headlines');
  }

  @override
  Future<void> saveTopHeadlinesNews(NewsResponseDto value) async {
    await newsBox.put('top_headlines', value);
  }
}
