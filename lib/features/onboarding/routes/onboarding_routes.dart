import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/onboarding/presentation/screens/onborading_screen.dart';
import 'package:news_app/features/onboarding/presentation/screens/splash_screen.dart';

class OnBoardingRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onBoarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ];
}
