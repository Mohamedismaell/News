import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/utility.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsCubit>()
        ..eitherFailureOrSuccessByCategory(category),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              _CategoryHeader(
                category: category,
              ),
              addVertical(10),
              _Posts(category: category)
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Text(category,
        style: AppTextStyles.headlLineLarge);
  }
}

class _Posts extends StatelessWidget {
  const _Posts({required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.newsByCategory!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Stack(
                  children: [
                    //! image
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: state
                                .newsByCategory![index]
                                .threadimageUrl ??
                            '',
                        height: 272,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          height: 272,
                          color: Colors.grey.shade300,
                          child: const Center(
                              child:
                                  CircularProgressIndicator()),
                        ),
                        errorWidget: (
                          context,
                          url,
                          error,
                        ) =>
                            Image.asset(
                          'assets/images/OIP.webp',
                          height: 272,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //! linear gradiant
                    Container(
                      height: 272,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: const [
                            Color.fromARGB(
                              0,
                              90,
                              90,
                              90,
                            ),
                            Color.fromARGB(
                              189,
                              0,
                              0,
                              0,
                            ),
                          ],
                        ),
                      ),
                    ),

                    //! category
                    Positioned(
                      left: 8,
                      top: 165,
                      child: SizedBox(
                        width: 350,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: AppTextStyles
                                  .hintTextSmall
                                  .copyWith(
                                color: AppColors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              maxLines: 2,
                              overflow:
                                  TextOverflow.ellipsis,
                              state.newsByCategory![index]
                                  .threadtitle
                                  .toString(),
                              style: AppTextStyles.textBold
                                  .copyWith(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! title
                  ],
                ),
                addVertical(20)
              ],
            );
          },
        );
      },
    );
  }
}
