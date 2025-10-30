import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/news_category.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';

class CategoryButton extends StatefulWidget {
  const CategoryButton({
    super.key,
    required this.category,
    required this.selectedCategory,
    required this.onSelected,
  });
  final NewsCategory category;
  final String? selectedCategory;
  final Function(String) onSelected;

  @override
  State<CategoryButton> createState() =>
      _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              _isSelected
                  ? const Color(0xFF465AD6)
                  : AppColors.white,
            ),
          ),
          onPressed: () =>
              widget.onSelected(widget.category.value),
          child: Text(
            widget.category.value.split(',').first.trim(),
            style: context.text.labelLarge!.copyWith(
              color: _isSelected
                  ? AppColors.white
                  : const Color(0xFF465AD6),
            ),
          ),
        );
      },
    );
  }

  bool get _isSelected =>
      widget.selectedCategory == widget.category.value;
}
