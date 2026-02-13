abstract class ProfileRepository {
  String? getProfileImagePath();
  Future<void> saveProfileImagePath(String value);
}
