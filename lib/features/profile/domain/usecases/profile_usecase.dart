import 'package:news_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileUseCase {
  final ProfileRepository repository;

  ProfileUseCase({required this.repository});

  // Future<Result<List<PostEntity>>> call({
  //   required NewsCategoryParams params,
  // }) {
  //   return repository.getNewsByCategory(params: params);
  // }
}
