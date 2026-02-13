import 'package:news_app/features/profile/data/datasources/profile_data_source.dart';

class ProfileLocalDataSource implements ProfileDataSource {
  // final Box<NewsResponseDto> newsBox;

  // String _categoryKey(String category) => 'category_$category';

  ProfileLocalDataSource();

  // @override
  // NewsResponseDto? getCategoryNews(String category) {
  //   return newsBox.get(_categoryKey(category));
  // }

  // @override
  // Future<void> saveCategoryNews(String category, NewsResponseDto value) async {
  //   await newsBox.put(_categoryKey(category), value);
  // }
}
