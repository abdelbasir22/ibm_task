import 'package:go_router/go_router.dart';
import 'package:ibm_task/core/utils/constance.dart';
import 'package:ibm_task/features/auth/presentation/views/login_view.dart';
import 'package:ibm_task/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const loginRout = '/';
  static const homeRout = '/home';

  final GoRouter router = GoRouter(
    initialLocation: uId != null && uId != '' ? '/home' : '/',
    routes: [
      GoRoute(
        path: loginRout,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: homeRout,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
