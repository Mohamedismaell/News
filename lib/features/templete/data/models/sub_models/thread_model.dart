import 'package:news_app/features/templete/data/models/sub_models/social_model.dart';
import '../../../../../core/database/api/end_points.dart';

class ThreadModel {
  final String? uuid;
  final String? url;
  final String? siteFull;
  final String? site;
  final String? siteSection;
  final List<String>? siteCategories;
  final String? sectionTitle;
  final String? titleFull;
  final String? published;
  final int? repliesCount;
  final int? participantsCount;
  final String? siteType;
  final String? country;
  final String? mainImage;
  final int? performanceScore;
  final int? domainRank;
  final String? domainRankUpdated;
  final SocialModel? social;

  ThreadModel({
    required this.uuid,
    required this.url,
    required this.siteFull,
    required this.site,
    required this.siteSection,
    required this.siteCategories,
    required this.sectionTitle,
    required this.titleFull,
    required this.published,
    required this.repliesCount,
    required this.participantsCount,
    required this.siteType,
    required this.country,
    required this.mainImage,
    required this.performanceScore,
    required this.domainRank,
    required this.domainRankUpdated,
    required this.social,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ApiKeys.uuid: uuid,
      ApiKeys.url: url,
      ApiKeys.siteFull: siteFull,
      ApiKeys.site: site,
      ApiKeys.siteSection: siteSection,
      ApiKeys.siteCategories: siteCategories,
      ApiKeys.sectionTitle: sectionTitle,
      ApiKeys.titleFull: titleFull,
      ApiKeys.published: published,
      ApiKeys.repliesCount: repliesCount,
      ApiKeys.participantsCount: participantsCount,
      ApiKeys.siteType: siteType,
      ApiKeys.country: country,
      ApiKeys.mainImage: mainImage,
      ApiKeys.performanceScore: performanceScore,
      ApiKeys.domainRank: domainRank,
      ApiKeys.domainRankUpdated: domainRankUpdated,
      ApiKeys.social: social?.toJson(),
    };
  }

  factory ThreadModel.fromJson(Map<String, dynamic> json) {
    return ThreadModel(
      uuid: json['uuid'] != null
          ? json['uuid'] as String
          : null,
      url: json['url'] != null
          ? json['url'] as String
          : null,
      siteFull: json['siteFull'] != null
          ? json['siteFull'] as String
          : null,
      site: json['site'] != null
          ? json['site'] as String
          : null,
      siteSection: json['siteSection'] != null
          ? json['siteSection'] as String
          : null,
      siteCategories: json['siteCategories'] != null
          ? List<String>.from(
              (json['siteCategories'] as List),
            )
          : null,
      sectionTitle: json['sectionTitle'] != null
          ? json['sectionTitle'] as String
          : null,
      titleFull: json['titleFull'] != null
          ? json['titleFull'] as String
          : null,
      published: json['published'] != null
          ? json['published'] as String
          : null,
      repliesCount: json['repliesCount'] != null
          ? json['repliesCount'] as int
          : null,
      participantsCount: json['participantsCount'] != null
          ? json['participantsCount'] as int
          : null,
      siteType: json['siteType'] != null
          ? json['siteType'] as String
          : null,
      country: json['country'] != null
          ? json['country'] as String
          : null,
      mainImage: json['mainImage'] != null
          ? json['mainImage'] as String
          : null,
      performanceScore: json['performanceScore'] != null
          ? json['performanceScore'] as int
          : null,
      domainRank: json['domainRank'] != null
          ? json['domainRank'] as int
          : null,
      domainRankUpdated: json['domainRankUpdated'] != null
          ? json['domainRankUpdated'] as String
          : null,
      social: json['social'] != null
          ? SocialModel.fromJson(
              json['social'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}
