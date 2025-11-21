import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/cubit/news/news_cubit.dart';
import '../../../../utility.dart';
import '../screens/news_details.dart';

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
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsDetails(
                              title: state
                                  .newsByCategory![index]
                                  .threadtitle,
                              description: state
                                  .newsByCategory![index]
                                  .threadText,
                              imageUrl: state
                                      .newsByCategory![
                                          index]
                                      .threadimageUrl ??
                                  '',
                              category: category,
                              author: state
                                  .newsByCategory![index]
                                  .author,
                            ),
                          ),
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
                              style: context
                                  .text.displayMedium!
                                  .copyWith(
                                color: const Color(
                                  0xFFF3F3F6,
                                ),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
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
                              style: context
                                  .text.displayMedium!
                                  .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
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
