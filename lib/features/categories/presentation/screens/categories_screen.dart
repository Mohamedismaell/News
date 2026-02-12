import 'package:flutter/material.dart';
import 'package:news_app/features/categories/presentation/widget/categories_button.dart';
import 'package:news_app/features/categories/presentation/widget/categories_header.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CategoriesBody();
  }
}

class _CategoriesBody extends StatelessWidget {
  const _CategoriesBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CategoriesHeader(),
            const CategoriesButton(),
          ],
        ),
      ),
    );
  }
}
