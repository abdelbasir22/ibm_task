import 'package:flutter/material.dart';
import 'package:ibm_task/features/auth/presentation/views/login_view.dart';
import 'package:provider/provider.dart';

import '../../../auth/presentation/manger/login_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home page",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () async {
                await Provider.of<AuthProvider>(context, listen: false)
                    .logout();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
