import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/core/database/cache/app_hive.dart';
import 'package:news_app/core/helper/hydrated_storage.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/presentation/manager/app_gate_cubit/app_gate_cubit.dart';
import 'package:news_app/core/shared/presentation/manager/connection_cubit/connection_cubit.dart';
import 'package:news_app/features/book_marks/presentation/manager/cubit/book_marks_cubit.dart';
import 'core/shared/presentation/manager/theme_cubit/theme_cubit.dart';
import 'core/shared/observers/app_bloc_observer.dart';
import 'core/shared/routes/app_router.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('Step 1: ensureInitialized done');

  Bloc.observer = AppBlocObserver();
  debugPrint('Step 2: Bloc observer set');

  HydratedBloc.storage = await buildHydratedStorage();
  debugPrint('Step 3: HydratedStorage built');

  await AppHive.init();
  debugPrint('Step 4: Hive Opened');

  await initializeDependencies(
    onboardingBox: AppHive.onboardingBox,
    newsBox: AppHive.newsBox,
  );
  debugPrint('Step 5: Service Locator initialized');
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
        BlocProvider(create: (context) => sl<BookMarksCubit>()),
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
                builder: DevicePreview.appBuilder,
              );
            });
      },
    );
  }
}
