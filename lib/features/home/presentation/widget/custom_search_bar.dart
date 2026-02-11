import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/theme/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(12.r),
      child: TextField(
        controller: searchController,
        autofocus: true,
        // clipBehavior: Clip.antiAlias,
        decoration: InputDecoration(
          // fillColor: Color(0xFFF3F4F6),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide.none,
          // ),
          suffixIcon: Icon(
            Icons.search,
            size: 24.sp,
            color: AppColors.greyPrimary,
          ),
          hintText: 'Search',
          // isCollapsed: true,
          prefixIcon: Icon(
            Icons.mic,
            size: 24.sp,
            color: AppColors.greyPrimary,
          ),
        ),
      ),
    );
  }
}
