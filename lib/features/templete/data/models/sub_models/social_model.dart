import 'package:news_app/features/templete/data/models/sub_models/facebook_model.dart';
import 'package:news_app/features/templete/data/models/sub_models/vk_model.dart';

class SocialModel {
  final String? updated;
  final FacebookModel? facebook;
  final VkModel? vk;

  SocialModel({
    required this.updated,
    required this.facebook,
    required this.vk,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'updated': updated,
      'facebook': facebook?.toJson(),
      'vk': vk?.toJson(),
    };
  }

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    return SocialModel(
      updated: json['updated'] != null
          ? json['updated'] as String
          : null,
      facebook: json['facebook'] != null
          ? FacebookModel.fromJson(
              json['facebook'] as Map<String, dynamic>,
            )
          : null,
      vk: json['vk'] != null
          ? VkModel.fromJson(
              json['vk'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}
