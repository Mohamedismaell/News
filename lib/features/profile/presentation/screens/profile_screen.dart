import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/enums/profile.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/features/profile/presentation/widget/custom_profile_options.dart';
import 'package:news_app/features/profile/presentation/widget/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: context.textTheme.headlineLarge,
            ),
            SizedBox(height: 32.h),
            ProfileHeader(),
            SizedBox(height: 32.h),
            for (var item in Profile.values)
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CustomProfileOptions(
                  widgetType: item,
                  onTap: () {},
                ),
              ),

            // CustomProfileOptions(
            //   widgetType: Profile.language,
            //   onTap: () {},
            // ),
            // CustomProfileOptions(
            //   widgetType: Profile.changePassword,
            //   onTap: () {},
            // ),
            // CustomProfileOptions(
            //   widgetType: Profile.privacy,
            //   onTap: () {},
            // ),
            // CustomProfileOptions(
            //   widgetType: Profile.termsAndConditions,
            //   onTap: () {},
            // ),
            // CustomProfileOptions(
            //   widgetType: Profile.signOut,
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
