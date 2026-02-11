import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/shared/data/models/articled_dto.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';
import 'package:news_app/core/shared/data/models/source_dto.dart';

class AppHive {
  static late Box<bool> onboardingBox;
  static late Box<NewsResponseDto> newsBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    registerAdapters();
    await openBoxes();
  }

  static void registerAdapters() {
    if (!Hive.isAdapterRegistered(ArticleDtoAdapter().typeId)) {
      Hive.registerAdapter(ArticleDtoAdapter());
    }
    if (!Hive.isAdapterRegistered(NewsResponseDtoAdapter().typeId)) {
      Hive.registerAdapter(NewsResponseDtoAdapter());
    }
    if (!Hive.isAdapterRegistered(SourceDtoAdapter().typeId)) {
      Hive.registerAdapter(SourceDtoAdapter());
    }
  }

  static Future<void> openBoxes() async {
    onboardingBox = await Hive.openBox<bool>('onboardingBox');
    newsBox = await Hive.openBox<NewsResponseDto>('newsBox');
  }
}
