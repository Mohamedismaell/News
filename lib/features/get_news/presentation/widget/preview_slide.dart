import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/get_news/presentation/cubit/news/news_cubit.dart';
import 'package:news_app/features/get_news/presentation/widget/stacked_image.dart';
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
          // height: 256,
          child: const CircularProgressIndicator()),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String? message;
  const _ErrorState({this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline,
                size: 48, color: Colors.red),
            SizedBox(height: 8),
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
      height: 256,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.newsByCategory!.length,
        itemBuilder: (context, index) {
          final post = state.newsByCategory![index];
          final category = state.selectedCategory
              .split(',')
              .first
              .trim();
          final isBookmarked = state.isBookmarked(post.id);
          return Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: StackedImage(
                    post: post,
                    category: category,
                    isBookmarked: isBookmarked,
                    imageHeight: 330,
                    imageWidth: 330,
                    textContainerWidth: 0.7,
                    // textContainerWidth: 300,
                  )),
              addHorizental(15),
            ],
          );
        },
      ),
    );
  }
}
