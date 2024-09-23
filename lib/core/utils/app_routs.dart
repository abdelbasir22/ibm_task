import 'package:go_router/go_router.dart';
import 'package:ibm_task/features/auth/presentation/views/login_view.dart';
import 'package:ibm_task/features/home/presentation/views/home_view.dart';

import 'package:provider/provider.dart';

import '../../features/auth/presentation/manger/login_provider.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: AuthProvider(),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => context.watch<AuthProvider>().isLoggedIn
            ? const HomeView()
            : const LoginView(),
      ),
    ],
  );
}
