import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/utility.dart';

import '../cubit/news/news_cubit.dart';

class RecommendedSection extends StatefulWidget {
  const RecommendedSection({super.key});

  @override
  State<RecommendedSection> createState() =>
      _RecommendedSectionState();
}

class _RecommendedSectionState
    extends State<RecommendedSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        print(
          "🧠 NewsByDate count: ${state.newsByDate?.length}",
        );

        if (state.dateStatus == NewsStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state.dateStatus == NewsStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Error'),
          );
        }
        if (state.newsByDate == null ||
            state.newsByDate!.isEmpty) {
          return Center(child: Text('No news available'));
        }
        return
        //! title Section
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.newsByDate!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  color: const Color.fromARGB(
                    21,
                    243,
                    243,
                    246,
                  ),
                  child: Row(
                    // mainAxisAlignment:
                    //     MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15),
                          color: context.colors.surface,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CachedNetworkImage(
                          imageUrl: state
                              .newsByDate![index]
                              .threadimageUrl
                              .toString(),
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget:
                              (context, url, error) {
                                return Image.asset(
                                  'assets/images/OIP.webp',
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.cover,
                                );
                              },
                        ),
                      ),
                      addHorizental(15),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                // horizontal: 5,
                                vertical: 10,
                              ),
                          child: SizedBox(
                            height: 160,
                            child: Column(
                              //handle
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  state
                                      .newsByDate![index]
                                      .author,
                                  style: context
                                      .text
                                      .displayMedium!
                                      .copyWith(),
                                ),
                                addVertical(40),

                                Text(
                                  maxLines: 4,
                                  overflow:
                                      TextOverflow.ellipsis,
                                  state
                                      .newsByDate![index]
                                      .threadtitle,
                                  style: context
                                      .text
                                      .headlineLarge!
                                      .copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // addVertical(100),
                    ],
                  ),
                ),
                addVertical(10),
              ],
            );
          },
        );
      },
    );
  }
}
