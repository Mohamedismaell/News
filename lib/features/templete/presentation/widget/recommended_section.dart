import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/utility.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: context.colors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.network(
                'https://media.zenfs.com/en/theguardian_763/a58864e4b73bdf8a1369a2dc836534ff',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            addHorizental(20),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'UI/UX Design',
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
          ],
        ),
        addVertical(20),
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: context.colors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.network(
                'https://media.zenfs.com/en/theguardian_763/a58864e4b73bdf8a1369a2dc836534ff',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            addHorizental(20),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'UI/UX Design',
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
          ],
        ),
        addVertical(20),
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: context.colors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.network(
                'https://media.zenfs.com/en/theguardian_763/a58864e4b73bdf8a1369a2dc836534ff',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            addHorizental(20),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'UI/UX Design',
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
          ],
        ),
      ],
    );
  }
}
