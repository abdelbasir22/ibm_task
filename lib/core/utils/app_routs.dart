import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibm_task/core/utils/constance.dart';
import 'package:ibm_task/features/auth/presentation/views/login_view.dart';
import 'package:ibm_task/features/home/presentation/views/home_view.dart';

import '../../features/auth/presentation/manger/auth_cubit/auth_cubit.dart';

class AppRouter {
  static const loginRout = '/';
  static const homeRout = '/home';

  final GoRouter router = GoRouter(
    initialLocation: uId != null ? '/home' : '/',
    routes: [
      GoRoute(
        path: loginRout,
        builder: (context, state) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, authState) {
              if (authState is AuthLoggedIn) {
                return const HomeView();
              } else {
                return const LoginView();
              }
            },
          );
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
