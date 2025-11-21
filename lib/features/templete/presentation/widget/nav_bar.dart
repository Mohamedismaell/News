import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NavigationBar(
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                size: 30,
                // color: AppColors.purplePrimary,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                Icons.grid_view_outlined,
                size: 30,
              ),
              label: ''),
          NavigationDestination(
              icon: Icon(
                Icons.bookmark_outline_sharp,
                size: 30,
              ),
              label: '')
        ],
      ),
    );
  }
}
