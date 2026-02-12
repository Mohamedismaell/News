import 'package:news_app/core/database/api/api_consumer.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';

class HomeRemoteDataSource {
  final ApiConsumer api;

  HomeRemoteDataSource({required this.api});

  Future<NewsResponseDto> getTopHeadLines() async {
    final newsCategoryRes = await api.get(
      EndPoints.topHeadLines,
      queryParameters: {
        'country': EndPoints.country,
        'apiKey': EndPoints.token,
      },
    );
    return NewsResponseDto.fromJsonMap(newsCategoryRes);
  }
}
