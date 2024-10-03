import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ibm_task/core/utils/app_colors.dart';
import 'package:ibm_task/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:ibm_task/features/auth/presentation/views/widget/custom_button.dart';
import 'package:ibm_task/features/auth/presentation/views/widget/custom_social_media_row.dart';
import 'package:ibm_task/features/auth/presentation/views/widget/custom_text_form_filed.dart';
import 'package:ibm_task/features/auth/presentation/views/widget/app_logo.dart';

import '../../../../../core/utils/app_routs.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final loginProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppLogo(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFiled(
                  lableText: 'Username or email',
                  hintText: 'Type your username or email',
                  keyboardType: TextInputType.emailAddress,
                  icon: const Icon(
                    Icons.person_outline,
                    size: 30,
                    color: AppColors.grey,
                  ),
                  controller: emailController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.contains('@')) {
                      return null;
                    } else {
                      return '*Email not valid';
                    }
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomTextFiled(
                  lableText: 'Password',
                  hintText: 'Type your password',
                  keyboardType: TextInputType.visiblePassword,
                  icon: const Icon(
                    Icons.lock_outline,
                    size: 30,
                    color: AppColors.grey,
                  ),
                  controller: passwordController,
                  obscureText: true,
                  validator: (String value) {
                    if (value.length < 5) {
                      return '*Invalid Password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password ?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darGgrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Login success'),
                        backgroundColor: AppColors.darkGreen,
                      ));
                      context.go(AppRouter.homeRout);
                    } else if (state is AuthFailuer) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        backgroundColor: AppColors.red,
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                                emailController.text,
                                passwordController.text,
                              );
                        }
                      },
                      text: 'LOGIN',
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .06,
                ),
                const Text(
                  'Or Sing Up Using',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darGgrey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                const CustomSocialMediaRow(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                const Text(
                  'Or Sing Up Using',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darGgrey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                const Text(
                  'SING UP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
