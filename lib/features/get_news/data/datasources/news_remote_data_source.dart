import 'package:news_app/core/database/api/api_consumer.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/params/news_category_params.dart';

import '../models/news_model.dart';

class NewsRemoteDataSource {
  final ApiConsumer api;

  NewsRemoteDataSource({required this.api});
  Future<NewsModel> getNewsByCategory(
    NewsCategoryParams params,
  ) async {
    // print(
    //   "🔍 GET Request URL: ${EndPoints.baseUrl}/${EndPoints.news}",
    // );
    // print(
    //   "🔍 Query Params: ${{'q': params.category != null ? EndPoints.formatCategoryQuery(params.category!) : EndPoints.defaultCategory, 'token': EndPoints.token}}",
    // );
    // print(
    //   'Looooooooooook here${Uri.encodeComponent('category:"politics"')}',
    // );
    final categoryQuery = params.category != null
        ? EndPoints.formatCategoryQuery(params.category!)
        : EndPoints.formatCategoryQuery(
            EndPoints.defaultCategory,
          );
    // print('🔍 Query: $categoryQuery');
    final newsCategoryRes = await api.get(
      EndPoints.news,
      queryParameters: {
        'token': EndPoints.token,
        'q': categoryQuery,
      },
    );
    return NewsModel.fromJson(newsCategoryRes);
  }

  Future<NewsModel> getNewsByDate() async {
    // print(
    //   'Looooooooooook here${EndPoints.baseUrl}/${EndPoints.news}',
    // );

    //! Edited to Date

    final lastDayByEpoch = (DateTime.now().subtract(
      Duration(days: 10),
    )).millisecondsSinceEpoch;
    // print(lastDayByEpoch);

    final newsCategoryRes = await api.get(
      EndPoints.news,
      queryParameters: {
        'token': EndPoints.token,
        'ts': '$lastDayByEpoch',
        'q': '*',
      },
    );
    return NewsModel.fromJson(newsCategoryRes);
  }

  // Future<Map<String, dynamic>> testDummyApi() async {
  //   final newsCategoryRes = await api.post(
  //     'https://dummyjson.com/auth/login',
  //     data: {
  //       'username': 'emilys',
  //       'password': 'emilyspass',
  //       'expiresInMins': 30,
  //     },
  //   );

  //   return newsCategoryRes;
  // }
}
