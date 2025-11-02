import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/templete/presentation/widget/news_details_appbar.dart';
import 'package:news_app/utility.dart';
import '../../../../core/di/service_locator.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({
    super.key,
    required this.imageUrl,
    required this.author,
    required this.category,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final String author;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsCubit>(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                NewsDetailsAppBar(
                  imageUrl: imageUrl,
                  category: category,
                  author: author,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Results',
                          style: context.text.displayMedium,
                        ),
                        addVertical(20),
                        Text(
                          title,
                          style: context.text.displayMedium,
                        ),
                        addVertical(20),
                        Text(
                          description,
                          style: context.text.displayMedium,
                        ),
                        addVertical(20),
                        // Text(
                        //   'Text Here',
                        //   style: context.text.displayMedium,
                        // ),
                        const SizedBox(height: 1000),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
// Title - text - url