import 'package:flutter/material.dart';
import 'package:ibm_task/features/auth/presentation/manger/login_provider.dart';
import 'package:ibm_task/features/auth/presentation/views/login_view.dart';
import 'package:ibm_task/features/home/presentation/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: authProvider.checkLoginStatus(),
          builder: (context, snapshot) {
            if (authProvider.isLoggedIn) {
              return const HomeView();
            } else {
              return const LoginView();
            }
          },
        ),
      );
    });
  }
}
