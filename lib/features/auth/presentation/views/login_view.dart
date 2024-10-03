import 'package:flutter/material.dart';
import 'package:ibm_task/features/auth/presentation/views/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
