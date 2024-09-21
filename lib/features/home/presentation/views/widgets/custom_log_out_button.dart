import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../auth/presentation/manger/login_provider.dart';
import '../../../../auth/presentation/views/login_view.dart';

class CustomLogOutButton extends StatelessWidget {
  const CustomLogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.exit_to_app,
        size: 32,
        color: AppColors.darkBlueGray,
      ),
      onPressed: () async {
        await Provider.of<AuthProvider>(context, listen: false).logout();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      },
    );
  }
}
