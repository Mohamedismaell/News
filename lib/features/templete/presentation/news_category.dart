// lib/core/enums/news_categories.dart
enum NewsCategory {
  politics('Politics'),
  businessFinance('Business and Finance'),
  economy('Economy'),
  scienceTechnology('Science and Technology'),
  crime('Crime'),
  lawJustice('Law and Justice');

  final String value;
  const NewsCategory(this.value);
}
