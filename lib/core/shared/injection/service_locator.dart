import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/shared/data/models/news_response_dto.dart';
import 'package:news_app/core/shared/injection/common_di.dart';
import 'package:news_app/features/book_marks/di/book_marks_injection.dart';
import 'package:news_app/features/home/di/home_injection.dart';
import 'package:news_app/features/onboarding/di/on_boarding_injection.dart';
import 'package:news_app/features/post_details/di/post_injection.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies({
  required Box<bool> onboardingBox,
  required Box<NewsResponseDto> newsBox,
}) async {
  await CommonDi.init(newsBox);
  OnboardingDi.init(onboardingBox: onboardingBox);
  HomeDi.init(newsBox);
  PostDi.init();
  BookMarksDi.init();
}
