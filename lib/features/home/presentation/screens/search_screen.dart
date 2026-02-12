import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/features/home/presentation/cubit/search/search_cubit.dart';
import 'package:news_app/features/home/presentation/widget/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.heroTag});
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomScrollView(
              slivers: [
                CustomSearchBar(),
                _SearchContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchContent extends StatelessWidget {
  const _SearchContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: state.searchResults.length,
          itemBuilder: (context, index) => ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            leading: Icon(Icons.access_time),
            title: Text(maxLines: 1, state.searchResults[index].title),
            trailing: Transform.rotate(
                angle: 4, child: Icon(Icons.arrow_forward_sharp)),
          ),
        );
      },
    );
  }
}
