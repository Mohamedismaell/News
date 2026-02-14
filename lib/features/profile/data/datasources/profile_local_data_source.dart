import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/features/profile/data/datasources/profile_data_source.dart';

class ProfileLocalDataSource implements ProfileDataSource {
  final Box<String> profileBox;

  ProfileLocalDataSource(this.profileBox);

  @override
  String? getProfileImagePath() {
    return profileBox.get('profileImagePath');
  }

  @override
  Future<void> saveProfileImagePath(String value) {
    return profileBox.put('profileImagePath', value);
  }
}
