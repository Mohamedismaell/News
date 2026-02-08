import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/get_news/presentation/widget/stacked_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utility.dart';

class PreviewSlide extends StatelessWidget {
  const PreviewSlide({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return switch (state.categoryStatus) {
          NewsStatus.loading => _LoadingState(),
          NewsStatus.error => _ErrorState(
              message: state.errorMessage,
            ),
          NewsStatus.loaded => _LoadedState(
              state: state,
            ),
          _ => const SizedBox.shrink()
        };
      },
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 256.w,
        height: 256.h,
        child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String? message;
  const _ErrorState({this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            SizedBox(height: 8.h),
            Text(message ?? 'Error loading news'),
          ],
        ),
      ),
    );
  }
}

class _LoadedState extends StatelessWidget {
  const _LoadedState({required this.state});
  final NewsState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.newsByCategory!.length,
        itemBuilder: (context, index) {
          final post = state.newsByCategory![index];
          final category = state.selectedCategory.split(',').first.trim();
          final isBookmarked = state.isBookmarked(post.id);
          return Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: StackedImage(
                    post: post,
                    category: category,
                    isBookmarked: isBookmarked,
                    imageWidth: 256.w,
                    imageHeight: 256.h,
                    textContainerWidth: 0.7,
                    // textContainerWidth: 300,
                  )),
              SizedBox(width: 15.w),
            ],
          );
        },
      ),
    );
  }
}
