class EndPoints {
  static String baseUrl = 'https://api.webz.io/';
  static String news = 'newsApiLite';
  static String token =
      '73e2257b-4e9a-41cb-9c34-a205e678e46a'; // static String key =
  static String defaultCategory = 'Politics';
  static String formatCategoryQuery(String category) {
    defaultCategory = category;
    return defaultCategory;
  }

  //     '4f76dfdf-b4f4-4300-98ce-a892b18d8c13';
}

class ApiKeys {
  static String status = 'status';
  static String errorMessage = 'errorMessage';
  static String shares = 'shares';
  static String thread = 'thread';
  static String uuid = 'uuid';
  static String url = 'url';
  static String siteFull = 'site_full';
  static String site = 'site';
  static String siteSection = 'site_section';
  static String siteCategories = 'site_categories';
  static String sectionTitle = 'section_title';
  static String titleFull = 'title_full';
  static String published = 'published';
  static String repliesCount = 'replies_count';
  static String participantsCount = 'participants_count';
  static String siteType = 'site_type';
  static String country = 'country';
  static String mainImage = 'main_image';
  static String performanceScore = 'performance_score';
  static String domainRank = 'domain_rank';
  static String domainRankUpdated = 'domain_rank_updated';
  static String social = 'social';
  static String updated = 'updated';
  static String facebook = 'facebook';
  static String likes = 'likes';
  static String comments = 'comments';
  static String faShares = 'shares';
  static String vkShares = 'shares';
}
