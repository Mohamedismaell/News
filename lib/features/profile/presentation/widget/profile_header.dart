import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/enums/profile.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/profile/presentation/manager/cubit/user_profile_cubit.dart';
import 'package:path_provider/path_provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  child: CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: state.imagePath != null
                          ? Image.file(
                              File(state.imagePath!),
                              fit: BoxFit.cover,
                            )
                          : Image.asset('assets/images/Rectangle 18.png'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pickImage(context);
                  },
                  child: Container(
                    width: 34.w,
                    height: 34.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorTheme.surface,
                    ),
                    child: Icon(Icons.camera_alt_outlined, size: 18.sp),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(
          width: 25.w,
        ),
        Column(
          children: [
            Text(
              'John Doe',
              style: context.textTheme.headlineMedium,
            ),
          ],
        ),
      ],
    );
  }
}

//Todo save image to in lcoal
void pickImage(BuildContext context) {
  final userProfileCubit = context.read<UserProfileCubit>();
  showDialog(
    context: context,
    builder: (context) {
      return BlocProvider.value(
        value: userProfileCubit,
        child: SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 16.h),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                final image = await pickPhoto(ImageOptions.camera);
                // print(' image?.path == > ${image?.path}');
                userProfileCubit.updateImagePath(image?.path);
                if (!context.mounted) return;
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt_outlined, size: 24.sp),
                  SizedBox(width: 8.w),
                  Text('Camera', style: context.textTheme.bodyLarge),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final image = await pickPhoto(ImageOptions.gallery);
                // print(' image?.path == > ${image?.path}');
                userProfileCubit.updateImagePath(image?.path);
                if (!context.mounted) return;
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.image_outlined, size: 24.sp),
                  SizedBox(width: 8.w),
                  Text('Gallery', style: context.textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<File?> pickPhoto(ImageOptions imageOptions) async {
  switch (imageOptions) {
    case ImageOptions.camera:
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        final savedImage = await saveImage(image);
        return savedImage;
      }
    case ImageOptions.gallery:
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final savedImage = await saveImage(image);
        return savedImage;
      }
  }
  return null;
}

Future<File?> saveImage(XFile image) async {
  final appDir = await getApplicationDocumentsDirectory();
  final newFile = await File(image.path).copy('${appDir.path}/${image.name}');
  return newFile;
}
