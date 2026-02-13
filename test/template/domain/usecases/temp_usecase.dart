import 'package:clean_arch/features/template/domain/repositories/temp_repository.dart';

class TemplateUseCase {
  final TemplateRepository repository;

  TemplateUseCase({required this.repository});

  // Future<Result<List<PostEntity>>> call({
  //   required NewsCategoryParams params,
  // }) {
  //   return repository.getNewsByCategory(params: params);
  // }
}
