import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/enums/news_category.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';
import 'package:news_app/core/shared/presentation/manager/news/category_news_cubit.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNewsCubit, NewsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: NewsCategory.values.map((
              category,
            ) {
              final isSelected = state.selectedCategory == category.value;
              return Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? context.colorTheme.primary
                              : context.colorTheme.surface,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r)),
                          elevation: 0),
                      onPressed: () => context
                          .read<CategoryNewsCubit>()
                          .selectCategory(category.value),
                      child: Text(
                        category.value.split(',').first.trim(),
                        style: context.textTheme.labelSmall!.copyWith(
                            color: isSelected
                                ? context.colorTheme.onPrimary
                                : context.colorTheme.onSurface),
                      )));
            }).toList(),
          ),
        );
      },
    );
  }
}
