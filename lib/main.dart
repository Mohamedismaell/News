import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/core/database/api/dio_consumer.dart';
import 'package:news_app/core/helper/hydrated_storage.dart';
import 'package:news_app/core/injection/service_locator.dart';
import 'package:news_app/features/get_news/data/datasources/news_remote_data_source.dart';

import 'core/observers/app_bloc_observer.dart';
import 'core/routes/app_router.dart';
import 'core/theme/manager/theme_cubit.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Step 1: ensureInitialized done');
  Bloc.observer = AppBlocObserver();
  print('Step 2: Bloc observer set');
  HydratedBloc.storage = await buildHydratedStorage();
  print('Step 3: HydratedStorage built');
  await initializeDependencies();
  print('Step 4: Service Locator initialized');
  // NewsRemoteDataSource(api: sl<DioConsumer>()).testDummyApi();
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
      providers: [BlocProvider(create: (context) => sl<ThemeCubit>())],
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
                routerConfig: AppRouter.router,
                builder: DevicePreview.appBuilder,
              );
            });
      },
    );
  }
}
