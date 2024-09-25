import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibm_task/core/utils/app_routs.dart';

import 'package:ibm_task/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:ibm_task/features/messages/presentation/manger/messages_cubit/messages_cubit.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()..checkLoginStatus()),
        BlocProvider(create: (_) => MessagesCubit()),
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
