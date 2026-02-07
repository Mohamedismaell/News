import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/routes/go_router_refresh_stream.dart';
import 'package:news_app/features/get_news/routes/home_routes.dart';
import 'package:news_app/features/onboarding/presentation/manager/cubit/on_boarding_cubit.dart';
import 'package:news_app/features/onboarding/routes/onboarding_routes.dart';

class AppRouter {
  final OnboardingCubit onboardingCubit;
  AppRouter({required this.onboardingCubit});
  // static GoRouter get router => _router;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(onboardingCubit.stream),
    redirect: (context, state) {
      final gate = context.read<OnboardingCubit>().state;
      if (gate is ShowOnboarding) return '/onboarding';
      if (gate is SkipOnboarding) return '/home';
      return null;
    },
    routes: [...OnBoardingRoutes.routes, ...HomeRoutes.routes],
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
}

//! Error Screen
class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Something went wrong!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? 'Unknown error occurred',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
// class GoRouterRefreshStream extends ChangeNotifier{
// final 

// }