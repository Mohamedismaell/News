import 'package:news_app/features/get_news/data/models/article_model.dart';
import 'package:news_app/features/get_news/domain/entities/post_entitiy.dart';

class ArticleMapper {
  static PostEntity toEntity(ArticleDto dto) {
    return PostEntity(
      id: dto.title,
      thereadurl: dto.urlToImage ?? '',
      threadtitle: dto.title,
      threadText: dto.description ?? '',
      threadimageUrl: dto.urlToImage ?? ' ',
      author: dto.author ?? 'Un Known',
      publishedAt: dto.publishedAt,
    );
  }
}
// DateTime.tryParse(dto.publishedAt ?? '') ?? DateTime.now(),
