import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:news_app/core/helper/hydrated_storage.dart';

import 'core/di/service_locator.dart';
import 'core/observers/app_bloc_observer.dart';
import 'core/routes/app_router.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'core/theme/theme_data/light_theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Step 1: ensureInitialized done');
  Bloc.observer = AppBlocObserver();
  print('Step 2: Bloc observer set');
  HydratedBloc.storage = await buildHydratedStorage();
  print('Step 3: HydratedStorage built');
  await initServiceLocator();
  print('Step 4: Service Locator initialized');

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => AppBootstrap()),
    // AppBootstrap(),
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = AppBlocObserver();
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: kIsWeb
  //       ? HydratedStorageDirectory.web
  //       : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  // );
  // await initServiceLocator();
  runApp(const MyApp());
}

//!providers
class AppBootstrap extends StatelessWidget {
  const AppBootstrap({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
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
            designSize: const Size(360, 690),
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
