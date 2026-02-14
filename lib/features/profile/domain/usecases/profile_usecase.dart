import 'package:news_app/features/profile/domain/repositories/profile_repository.dart';

class GetProfileImageUseCase {
  final ProfileRepository repository;

  GetProfileImageUseCase({required this.repository});

  Future<String?> call() async {
    return repository.getProfileImagePath();
  }
}

class SaveProfileImageUseCase {
  final ProfileRepository repository;

  SaveProfileImageUseCase({required this.repository});

  Future<void> call(String value) async {
    return repository.saveProfileImagePath(value);
  }
}
