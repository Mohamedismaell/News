import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/routes/go_router_refresh_stream.dart';
import 'package:news_app/core/manager/app_gate_cubit/app_gate_cubit.dart';
import 'package:news_app/features/get_news/routes/home_routes.dart';
import 'package:news_app/features/onboarding/routes/onboarding_routes.dart';
import 'package:news_app/core/shell/app_shell.dart';

class AppRouter {
  final AppGateCubit appGateCubit;
  AppRouter({required this.appGateCubit});
  // static GoRouter get router => _router;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: GoRouterRefreshStream(appGateCubit.stream),
    redirect: (context, state) {
      final gate = context.read<AppGateCubit>().state;
      final path = state.uri.path;

      if (gate is AppGateOnboarding) {
        if (path != AppRoutes.onBoarding) return AppRoutes.onBoarding;
        return null;
      }

      if (gate is AppGateSkipOnboarding) {
        if (path == AppRoutes.onBoarding || path == AppRoutes.splash) {
          return AppRoutes.home;
        }
        return null;
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(
            location: state.uri.toString(),
            child: child,
          );
        },
        routes: [...OnBoardingRoutes.routes, ...HomeRoutes.routes],
      ),
    ],
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