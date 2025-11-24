import '../../domain/entities/post_entitiy.dart';

class NewsDetailsArgs {
  final PostEntity post;
  final String category;

  const NewsDetailsArgs({
    required this.post,
    required this.category,
  });
}
