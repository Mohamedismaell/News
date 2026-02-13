import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage('assets/images/Rectangle 18.png')),
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
