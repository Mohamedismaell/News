import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../utility.dart';
import '../cubit/news/news_cubit.dart';
import '../model/news_detail_args.dart';

class BookMarksScreen extends StatelessWidget {
  const BookMarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return ListView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: state.bookmarks!.length,
          itemBuilder: (context, index) {
            final post = state.bookmarks![index].post;
            final category =
                state.bookmarks![index].category;
            return Column(
              children: [
                InkWell(
                  onTap: () async => await context.push(
                      AppRoutes.newsDetails,
                      extra: NewsDetailsArgs(
                          post: post,
                          category: post.categories.first)),
                  child: Stack(
                    children: [
                      //! image
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              post.threadimageUrl ?? '',
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

                      //! category + title
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
                                post.threadtitle.toString(),
                                style: AppTextStyles
                                    .textBold
                                    .copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
