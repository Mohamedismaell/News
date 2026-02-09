import 'package:news_app/core/database/api/api_consumer.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/params/news_category_params.dart';
import 'package:news_app/features/get_news/data/models/base_response.dart';

class NewsRemoteDataSource {
  final ApiConsumer api;

  NewsRemoteDataSource({required this.api});
  Future<NewsResponseDto> getNewsByCategory(
    NewsCategoryParams params,
  ) async {
    final response = await api.get(
      EndPoints.allNews,
      queryParameters: {
        'q': params.category,
        'apiKey': EndPoints.token,
      },
    );
    return NewsResponseDto.fromJsonMap(response);
  }

  // Future<NewsModel> getNewsByDate() async {
  //   final lastDayByEpoch = (DateTime.now().subtract(
  //     Duration(days: 10),
  //   )).millisecondsSinceEpoch;

  //   final newsCategoryRes = await api.get(
  //     EndPoints.allNews,
  //     queryParameters: {
  //       'token': EndPoints.token,
  //       'ts': '$lastDayByEpoch',
  //       'q': '*',
  //     },
  //   );
  //   return NewsModel.fromJson(newsCategoryRes);
  // }
}
