import 'package:news_app/core/helper/result.dart';
import 'package:news_app/core/shared/domain/entities/post_entitiy.dart';
import 'package:news_app/core/shared/params/news_category_params.dart';
import 'package:news_app/features/home/domain/repositories/news_repository.dart';

class SearchUseCase {
  final NewsRepository repository;

  SearchUseCase({required this.repository});

  Future<Result<List<PostEntity>>> call(NewsCategoryParams query) {
    return repository.getNewsByCategory(params: query);
  }
}
