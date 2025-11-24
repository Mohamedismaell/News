import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/templete/presentation/model/news_detail_args.dart';
import '../../../../utility.dart';

class PreviewSlide extends StatelessWidget {
  const PreviewSlide({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state.categoryStatus == NewsStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.categoryStatus == NewsStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Error'),
          );
        }
        if (state.newsByCategory == null ||
            state.newsByCategory!.isEmpty) {
          return Center(child: Text('No news available'));
        }
        return SizedBox(
          height: 256,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.newsByCategory!.length,
            itemBuilder: (context, index) {
              final category = state.selectedCategory
                  .split(',')
                  .first
                  .trim();
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () async {
                        //! edit the nav with Go Router
                        await context.push(
                          AppRoutes.newsDetails,
                          extra: NewsDetailsArgs(
                              post: state
                                  .newsByCategory![index],
                              category: category),
                        );
                      },
                      child: Stack(
                        children: [
                          //! image
                          CachedNetworkImage(
                            imageUrl: state
                                    .newsByCategory![index]
                                    .threadimageUrl ??
                                '',
                            width: 330,
                            height: 300,
                            fit: BoxFit.cover,
                            placeholder: (_, __) =>
                                Container(
                              width: 330,
                              height: 300,
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
                              width: 330,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                          //! linear gradiant
                          Container(
                            width: 330,
                            height: 300,
                            decoration: BoxDecoration(
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
                            left: 14,
                            top: 165,
                            child: Text(
                              category,
                              style: AppTextStyles
                                  .hintTextSmall
                                  .copyWith(
                                color: AppColors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          //! title
                          Positioned(
                            left: 14,
                            right: 14,
                            top: 200,
                            child: Text(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  addHorizental(20),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
