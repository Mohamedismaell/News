import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/features/home/presentation/cubit/search/search_cubit.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.center,
            style: IconButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
              color: AppColors.greyPrimary,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                context.read<SearchCubit>().search(value);
              },
              controller: searchController,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Search'),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                size: 24.sp,
                color: AppColors.greyPrimary,
              )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 24.sp,
              color: AppColors.greyPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
