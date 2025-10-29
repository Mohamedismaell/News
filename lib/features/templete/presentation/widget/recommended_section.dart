import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/templete/presentation/screens/cubit/news_cubit.dart';
import 'package:news_app/utility.dart';

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
        if (state.status == NewsStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state.status == NewsStatus.error) {
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
            return Row(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: context.colors.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(
                          0.1,
                        ),
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
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        'assets/images/OIP.webp',
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                addHorizental(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        state
                            .newsByDate![index]
                            .threadtitle,
                        style: context.text.headlineLarge!
                            .copyWith(),
                      ),
                      addVertical(20),
                      Text(
                        'A Simple Trick For Creating',
                        style: context.text.displayMedium!
                            .copyWith(),
                      ),
                    ],
                  ),
                ),
                addVertical(20),
              ],
            );
          },
        );
      },
    );
  }
}
