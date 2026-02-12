import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/features/post_details/domain/repositories/post_repository.dart';

class GetSpecificPost {
  final PostRepository repository;

  GetSpecificPost({required this.repository});

  Future<Result<PostEntity>> call({
    required NewsCategoryParams params,
  }) {
    return repository.getSpecificPost(params: params);
  }
}
