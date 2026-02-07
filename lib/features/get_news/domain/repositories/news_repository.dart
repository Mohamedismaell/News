import 'package:news_app/core/params/news_category_params.dart';

import '../../../../core/connections/result.dart';
import '../entities/post_entitiy.dart';

abstract class NewsRepository {
  Future<Result<List<PostEntity>>> getNewsByCategory({
    required NewsCategoryParams params,
  });
  Future<Result<List<PostEntity>>> getNewsByDate();
}
