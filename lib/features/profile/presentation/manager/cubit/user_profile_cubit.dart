import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:path_provider/path_provider.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(
    this.getProfileImageUseCase,
    this.saveProfileImageUseCase,
  ) : super(UserProfileState());
  final GetProfileImageUseCase getProfileImageUseCase;
  final SaveProfileImageUseCase saveProfileImageUseCase;

  void updateImagePath(String? value) {
    final updated = state.copyWith(imagePath: value);
    emit(updated);
  }

  Future<void> saveImagePath(String value) async {
    await saveProfileImageUseCase.call(value);
    emit(state.copyWith(imagePath: value));
  }

  Future<void> getImagePath() async {
    final imagePath = await getProfileImageUseCase.call();
    emit(state.copyWith(imagePath: imagePath));
  }

  Future<File?> saveImageFile(XFile image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final newFile = await File(image.path).copy('${appDir.path}/${image.name}');
    await saveImagePath(newFile.path);
    return newFile;
  }
}
