import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/injection/common_di.dart';
import 'package:news_app/features/home/data/models/news_response_dto.dart';
import 'package:news_app/features/home/di/home_injection.dart';
import 'package:news_app/features/onboarding/di/on_boarding_injection.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies({
  required Box<bool> onboardingBox,
  required Box<NewsResponseDto> newsBox,
}) async {
  await CommonDi.init();
  OnboardingDi.init(onboardingBox: onboardingBox);
  HomeDi.init(newsBox);
}
