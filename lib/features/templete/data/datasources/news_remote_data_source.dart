import 'package:news_app/core/params/params.dart';

import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../models/news_model.dart';

class NewsRemoteDataSource {
  final ApiConsumer api;

  NewsRemoteDataSource({required this.api});
  Future<NewsModel> getNewsByCategory(
    NewsParams params,
  ) async {
    final response = await api.get(
      "${EndPoints.baseUrl}/${EndPoints.news}",
      queryParameters: {
        'q': params.category != null
            ? EndPoints.formatCategoryQuery(
                params.category!,
              )
            : EndPoints.defaultCategory,
        'token': EndPoints.token,
      },
    );
    return NewsModel.fromJson(response);
  }
}
