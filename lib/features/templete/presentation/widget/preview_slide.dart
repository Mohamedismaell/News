import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/screens/cubit/news_cubit.dart';
import 'package:news_app/utility.dart';

class PreviewSlide extends StatelessWidget {
  const PreviewSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: state.status == NewsStatus.loading
              ? Center(child: CircularProgressIndicator())
              : state.status == NewsStatus.error
              ? Center(
                  child: Text(
                    state.errorMessage.toString(),
                  ),
                )
              : Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            '${state.news?[2].threadimageUrl.toString()}',
                            width: 330,
                            height: 256,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: 330,
                            height: 256,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
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
                          Positioned(
                            left: 24,
                            top: 150,
                            child: Text(
                              'Politics',
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
                          Positioned(
                            left: 24,
                            top: 184,
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                'The latest situation in the presidential election',
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
                          ),
                        ],
                      ),
                    ),
                    addHorizental(20),
                  ],
                ),
        );
      },
    );
  }
}
