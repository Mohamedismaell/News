// lib/core/enums/news_categories.dart
enum NewsCategory {
  politics('Politics'),
  businessFinance('Economy, Business and Finance'),
  economy('Education'),
  scienceTechnology('Sport'),
  crime('Crime'),
  labor('Labor'),
  lifestyleAndleisure('Lifestyle and Leisure'),
  religionAndBelief('Religion and Belief'),
  weather('Weather');

  final String value;
  const NewsCategory(this.value);
}
