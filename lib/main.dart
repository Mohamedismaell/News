import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/core/helper/hydrated_storage.dart';
import 'package:news_app/core/injection/service_locator.dart';
import 'package:news_app/core/manager/app_gate/app_gate_cubit.dart';
import 'package:news_app/core/manager/connection/connection_cubit.dart';
import 'package:news_app/core/shell/app_shell.dart';
import 'core/observers/app_bloc_observer.dart';
import 'core/routes/app_router.dart';
import 'core/manager/theme/theme_cubit.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Step 1: ensureInitialized done');
  Bloc.observer = AppBlocObserver();
  print('Step 2: Bloc observer set');
  HydratedBloc.storage = await buildHydratedStorage();
  print('Step 3: HydratedStorage built');
  await Hive.initFlutter();
  final onboardingBox = await Hive.openBox('onboardingBox');
  print('Step 4: Hive Opened');
  await initializeDependencies(onboardingBox: onboardingBox);
  print('Step 5: Service Locator initialized');
  debugPaintSizeEnabled = false;

  runApp(
    // DevicePreview(enabled: !kReleaseMode, builder: (context) => AppBootstrap()),
    AppBootstrap(),
  );
}

//!providers
class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ThemeCubit>()),
        BlocProvider(create: (context) => sl<AppGateCubit>()),
        BlocProvider(create: (context) => sl<AppConnectionCubit>()),
        // BlocProvider(create: (context) => sl<NewsCubit>()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, mode) {
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                // locale: DevicePreview.locale(context),
                // builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                theme: getLightTheme(),
                darkTheme: getDarkTheme(),
                themeMode: mode.themeMode,
                routerConfig: sl<AppRouter>().router,
                builder: (context, child) {
                  if (child == null) return const SizedBox.shrink();
                  final previewWrapped = DevicePreview.appBuilder(
                    context,
                    child,
                  );
                  return AppShell(child: previewWrapped);
                },
              );
            });
      },
    );
  }
}
