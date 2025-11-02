import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/domain/usecases/get_news.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/utility.dart';
import '../../../../core/connections/network_info.dart';
import '../../../../core/database/api/dio_consumer.dart';
import '../../../../core/di/service_locator.dart';
import '../../data/datasources/news_remote_data_source.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../news_category.dart';
import '../widget/category_button.dart';
import '../widget/preview_slide.dart';
import '../widget/top_news.dart';
import '../widget/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<NewsCubit>(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 28.0,
                  right: 16.01,
                ),
                child: Center(
                  child: ListView(
                    children: [
                      Text(
                        'Browse',
                        style: context.text.displayMedium!
                            .copyWith(fontSize: 24),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Discover thing of this world',
                        style: context.text.labelLarge!
                            .copyWith(
                              color:
                                  AppColors.greyLightDark,
                            ),
                      ),
                      SizedBox(height: 34),
                      BarSearch(),
                      SizedBox(height: 24),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...NewsCategory.values.map((
                              category,
                            ) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(
                                      right: 10,
                                    ),
                                child: CategoryButton(
                                  category: category,
                                  selectedCategory: state
                                      .selectedCategory,
                                  onSelected: (value) =>
                                      context
                                          .read<NewsCubit>()
                                          .selectCategory(
                                            value,
                                          ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      addVertical(14),
                      PreviewSlide(),
                      addVertical(24),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Top News',
                              style: context
                                  .text
                                  .displayLarge!
                                  .copyWith(fontSize: 26),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: const Color(
                                  0xFF7C81A1,
                                ),
                                fontSize: 18,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                height: 1.71,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TopNewsSection(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
