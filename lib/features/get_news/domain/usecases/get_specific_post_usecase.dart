import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/params/news_category_params.dart';

import '../entities/post_entitiy.dart';
import '../repositories/news_repository.dart';

class GetSpecificPost {
  final NewsRepository repository;

  GetSpecificPost({required this.repository});

  Future<Result<PostEntity>> callSpecificPost({
    required NewsCategoryParams params,
  }) {
    return repository.getSpecificPost(params: params);
  }
}
