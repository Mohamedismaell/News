import 'package:news_app/features/categories/domain/repositories/categories_repository.dart';

class CategoriesUseCase {
  final CategoriesRepository repository;

  CategoriesUseCase({required this.repository});

  // Future<Result<List<PostEntity>>> call({
  //   required NewsCategoryParams params,
  // }) {
  //   return repository.getNewsByCategory(params: params);
  // }
}
