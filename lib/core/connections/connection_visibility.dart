import 'package:news_app/core/routes/app_routes.dart';

bool shouldShowConnectionBanner(String location) {
  return !location.startsWith(AppRoutes.splash) &&
      !location.startsWith(AppRoutes.onBoarding);
}
