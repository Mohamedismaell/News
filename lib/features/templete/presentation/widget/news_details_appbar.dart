import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/utility.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({
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
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
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
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.7),
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
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.ios_share_outlined,
                      color: Colors.white,
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      color: const Color(0xFF465AD6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        'Category',
                        style: context.text.headlineSmall!
                            .copyWith(
                          fontSize: 20,
                          color: AppColors.purpleLighter,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  addVertical(10),
                  SizedBox(
                    width: 315,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        maxLines: 2,
                        'Author',
                        overflow: TextOverflow.ellipsis,
                        style: context.text.displayLarge!
                            .copyWith(
                          height: 1.15,
                          fontFamily: 'SFProText',
                          color: AppColors.purpleLighter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //! little title
            //   Positioned(
            //     left: 25,
            //     bottom: 60,
            //     child: SizedBox(
            //       width: 315,
            //       child: Text(
            //         maxLines: 2,
            //         'Author',
            //         overflow: TextOverflow.ellipsis,
            //         style: context.text.displayLarge!
            //             .copyWith(
            //               height: 1.15,
            //               fontFamily: 'SFProText',
            //               color: AppColors.purpleLighter,
            //             ),
            //       ),
            //     ),
            //   ),
            //
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 32,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
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
