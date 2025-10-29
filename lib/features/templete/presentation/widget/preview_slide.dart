import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/screens/cubit/news_cubit.dart';
import 'package:news_app/utility.dart';

class PreviewSlide extends StatelessWidget {
  const PreviewSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state.status == NewsStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == NewsStatus.error) {
            return Center(
              child: Text(state.errorMessage ?? 'Error'),
            );
          }
          if (state.validatedNews == null ||
              state.validatedNews!.isEmpty) {
            return Center(child: Text('No news available'));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.validatedNews!.length,
            itemBuilder: (context, index) {
              return state.status == NewsStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.status == NewsStatus.error
                  ? Center(
                      child: Text(
                        state.errorMessage.toString(),
                      ),
                    )
                  : Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(12),
                          child: Stack(
                            children: [
                              //! image
                              CachedNetworkImage(
                                imageUrl:
                                    state
                                        .validatedNews?[index]
                                        .threadimageUrl ??
                                    '',
                                width: 330,
                                height: 300,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget:
                                    (
                                      context,
                                      url,
                                      error,
                                    ) => Image.asset(
                                      'assets/images/OIP.webp',
                                      width: 350,
                                      height: 240,

                                      fit: BoxFit.cover,
                                    ),
                              ),

                              //! linear gradiant
                              Container(
                                width: 330,
                                height: 300,

                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin:
                                        Alignment.topCenter,
                                    end: Alignment
                                        .bottomCenter,
                                    colors: [
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
                                      ), // Heavy dark at bottom] ],
                                    ],
                                  ),
                                ),
                              ),
                              //! category
                              Positioned(
                                left: 14,
                                top: 190,
                                child: Text(
                                  state.selectedCategory,
                                  style: context
                                      .text
                                      .displayMedium!
                                      .copyWith(
                                        color: const Color(
                                          0xFFF3F3F6,
                                        ),
                                        fontSize: 20,
                                        fontWeight:
                                            FontWeight.w400,
                                      ),
                                ),
                              ),
                              //! title
                              Positioned(
                                left: 14,
                                right: 14,
                                top: 230,
                                child: Text(
                                  maxLines: 2,
                                  overflow:
                                      TextOverflow.ellipsis,
                                  state
                                      .validatedNews![index]
                                      .threadtitle
                                      .toString(),
                                  style: context
                                      .text
                                      .displayMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight:
                                            FontWeight.w700,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addHorizental(20),
                      ],
                    );
            },
          );
        },
      ),
    );
  }
}
