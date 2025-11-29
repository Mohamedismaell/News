import 'package:news_app/core/database/api/end_points.dart';

class VkModel {
  final int? shares;

  VkModel({required this.shares});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{ApiKeys.vkShares: shares};
  }

  factory VkModel.fromJson(Map<String, dynamic> json) {
    return VkModel(
      shares: json[ApiKeys.vkShares] != null
          ? json[ApiKeys.vkShares] as int
          : null,
    );
  }
}
