import 'package:flutter/material.dart';
import 'package:ibm_task/core/utils/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                AppColors.lightBlueGray,
                AppColors.blueGray,
                AppColors.purple,
                AppColors.darkPurple,
              ],
            ),
          ),
          child: const Center(
            child: Text(
              'My App',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
