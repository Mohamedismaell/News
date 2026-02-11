import 'package:news_app/core/database/api/api_consumer.dart';
import 'package:news_app/core/database/api/end_points.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';

class PostRemoteDataSource {
  final ApiConsumer api;

  PostRemoteDataSource({required this.api});

  Future<NewsResponseDto> getSpecificPost(NewsCategoryParams params) async {
    final response = await api.get(
      EndPoints.allNews,
      queryParameters: {
        'q': params.category,
        'apiKey': EndPoints.token,
      },
    );
    return NewsResponseDto.fromJsonMap(response);
  }
}
