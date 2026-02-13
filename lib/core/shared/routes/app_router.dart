import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/core/shared/routes/go_router_refresh_stream.dart';
import 'package:news_app/core/shared/presentation/manager/app_gate_cubit/app_gate_cubit.dart';
import 'package:news_app/features/book_marks/routes/home_routes.dart';
import 'package:news_app/features/categories/routes/categories_routes.dart';
import 'package:news_app/features/home/routes/home_routes.dart';
import 'package:news_app/features/onboarding/routes/onboarding_routes.dart';
import 'package:news_app/core/shared/presentation/shell/app_shell.dart';
import 'package:news_app/features/post_details/routes/post_details_routes.dart';

class AppRouter {
  final AppGateCubit appGateCubit;
  AppRouter({required this.appGateCubit});
  // static GoRouter get router => _router;

  late final GoRouter router = GoRouter(
    // navigatorKey: ,
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
      ...OnBoardingRoutes.routes,
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(
            location: state.uri.toString(),
            child: child,
          );
        },
        routes: [
          ...HomeRoutes.routes,
          ...CategoriesRoutes.routes,
          ...BookMarksRoutes.routes
        ],
      ),
      ...PostDetailsRoutes.routes,
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