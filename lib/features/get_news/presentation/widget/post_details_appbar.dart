import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_text_styles.dart';
import 'package:news_app/core/theme/extensions/theme_extension.dart';

class PostDetailsAppbar extends StatelessWidget {
  const PostDetailsAppbar({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.author,
  });

  final String imageUrl;
  final String category;
  final String author;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 450,
      pinned: true,
      stretch: true,
      elevation: 0.0,
      backgroundColor: AppColors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
            //! image
            Opacity(
              opacity: 0.9,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //! Grdiant
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.5),
                      Colors.black.withValues(alpha: 0.7),
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ),
                ),
              ),
            ),
            //! buttons
            Positioned(
              top: 80,
              right: 10,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.bookmark_border_outlined,
                      color: AppColors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.ios_share_outlined,
                      color: AppColors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            //! category + Author
            Positioned(
              left: 15,
              bottom: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      category,
                      style: AppTextStyles.textSemibold.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    author,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.headlLineMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            //! little title
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.customColors.bottomAppbar,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: 100,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
    );
  }
}
