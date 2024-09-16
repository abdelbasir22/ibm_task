import 'package:flutter/material.dart';
import 'package:ibm_task/core/utils/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            color: AppColors.darkGreen,
          ),
          child: const Center(
            child: Text(
              'Chat',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.liteGreen,
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: AppColors.green,
          ),
          child: const Center(
            child: Text(
              'App',
              style: TextStyle(
                fontSize: 22,
                color: AppColors.lime,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
