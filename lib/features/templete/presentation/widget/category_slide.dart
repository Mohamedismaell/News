import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utility.dart';

class CategorySlide extends StatelessWidget {
  const CategorySlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color(0xFF465AD6),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Random',
              style: context.text.labelLarge!.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          addHorizental(20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color(0xFF465AD6),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Gaming',
              style: context.text.labelLarge!.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          addHorizental(20),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color(0xFF465AD6),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Sport',
              style: context.text.labelLarge!.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          addHorizental(20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color(0xFF465AD6),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Fun',
              style: context.text.labelLarge!.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          addHorizental(20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color(0xFF465AD6),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Programming',
              style: context.text.labelLarge!.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
