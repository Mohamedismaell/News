import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/on_boarding/presentation/screens/onborading_screen.dart';

class OnBoardingRoutes {
  static List<RouteBase> routes = [
    GoRoute(
      path: AppRoutes.onBoarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ];
}
// class OnboardingRoutes extends StatefulWidget {
//   const OnboardingRoutes({super.key});

//   @override
//   State<OnboardingRoutes> createState() => _OnboardingRoutesState();
// }

// class _OnboardingRoutesState extends State<OnboardingRoutes>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
