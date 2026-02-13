import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/shared/injection/service_locator.dart';
import 'package:news_app/core/shared/routes/app_routes.dart';
import 'package:news_app/features/profile/presentation/manager/cubit/user_profile_cubit.dart';
import 'package:news_app/features/profile/presentation/screens/profile_screen.dart';

class ProfileRoutes {
  static GoRoute tabRoute = GoRoute(
    path: AppRoutes.profile,
    builder: (context, state) => BlocProvider(
      create: (context) => sl<UserProfileCubit>(),
      child: const ProfileScreen(),
    ),
  );
}
