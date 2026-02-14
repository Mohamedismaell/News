abstract class ProfileDataSource {
  String? getProfileImagePath();
  Future<void> saveProfileImagePath(String value);
}
