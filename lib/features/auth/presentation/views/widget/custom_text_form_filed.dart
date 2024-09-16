import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.obscureText,
    this.keyboardType,
    required this.validator,
    required this.lableText,
  });
  final String hintText;
  final String lableText;
  final Icon icon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? s) {
        return validator(s);
      },
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        prefixIcon: icon,
        labelText: lableText,
        labelStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.black,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
