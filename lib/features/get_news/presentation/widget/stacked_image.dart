import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';
import 'package:news_app/utility.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/news/news_cubit.dart';
import '../model/news_detail_args.dart';

class StackedImage extends StatelessWidget {
  const StackedImage(
      {super.key,
      required this.post,
      this.category,
      required this.isBookmarked,
      required this.imageHeight,
      this.imageWidth,
      required this.textContainerWidth});
  final PostEntity post;
  final String? category;
  final bool isBookmarked;
  final double imageHeight;
  final double? imageWidth;
  final double textContainerWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await context.push(AppRoutes.newsDetails,
          extra: NewsDetailsArgs(post: post, category: post.categories.first)),
      child: Stack(
        children: [
          //! image
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: post.threadimageUrl ?? '',
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
              placeholder: (_, __) => SizedBox(
                height: imageHeight,
                width: imageWidth,
                child: Text('dsadadsa'),
              ),
              errorWidget: (
                context,
                url,
                error,
              ) =>
                  Image.asset(
                'assets/images/OIP.webp',
                height: imageHeight,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //! linear gradiant
          Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
          //! Saved icon
          Positioned(
            right: 5.w,
            top: 5.h,
            child: IconButton(
                onPressed: () => context
                    .read<NewsCubit>()
                    .toggleBookmark(post, category: category),
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: AppColors.white,
                  size: 30.r,
                )),
          ),
          //! category + title
          Positioned(
            left: 10,
            top: 155,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * textContainerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category ?? post.categories.first,
                    style: AppTextStyles.hintTextSmall.copyWith(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                  addVertical(5),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    post.threadtitle.toString(),
                    style: AppTextStyles.textBold.copyWith(
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
    );
  }
}
