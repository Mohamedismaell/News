// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_profile_cubit.dart';

@immutable
class UserProfileState extends Equatable {
  final String? imagePath;
  const UserProfileState({this.imagePath});

  UserProfileState copyWith({
    String? imagePath,
  }) {
    return UserProfileState(
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  List<Object?> get props => [imagePath];
}
