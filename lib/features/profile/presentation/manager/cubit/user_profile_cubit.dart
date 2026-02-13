import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileState());

  void updateImagePath(String? value) {
    final updated = state.copyWith(imagePath: value);
    emit(updated);
  }
}
