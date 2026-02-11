import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/presentation/widget/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.heroTag});
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Hero(
                  tag: heroTag,
                  child: CustomSearchBar(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SizedBox(),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
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
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const SizedBox();
      },
    );
  }
}
