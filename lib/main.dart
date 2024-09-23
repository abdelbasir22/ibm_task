import 'package:flutter/material.dart';
import 'package:ibm_task/core/utils/app_routs.dart';
import 'package:ibm_task/features/auth/presentation/manger/login_provider.dart';
import 'package:ibm_task/features/messages/presentation/manger/messages_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()..checkLoginStatus()),
        ChangeNotifierProvider(create: (_) => MessagesProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
