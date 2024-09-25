import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ibm_task/core/utils/app_routs.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../auth/presentation/manger/auth_cubit/auth_cubit.dart';

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
        await context.read<AuthCubit>().logout();
        context.go(AppRouter.loginRout);
      },
    );
  }
}
