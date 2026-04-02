import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_back_button.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBackButton(),
                  SizedBox(height: 28.h),
                  Text(
                    LocaleKeys.register.tr(),
                    style: AppTextStyle.text30Regular,
                  ),
                  SizedBox(height: 32.h),
                  AppTextFormField(
                    labelText: LocaleKeys.username.tr(),
                    controller: authCubit.userNameController,
                  ),
                  SizedBox(height: 15.h),
                  AppTextFormField(
                    labelText: LocaleKeys.enter_your_email.tr(),
                    controller: authCubit.emailController,
                  ),
                  SizedBox(height: 15.h),
                  AppTextFormField(
                    labelText: LocaleKeys.enter_your_password.tr(),
                    isPassword: true,
                    controller: authCubit.passwordController,
                  ),
                  SizedBox(height: 15.h),
                  AppTextFormField(
                    labelText: LocaleKeys.confirm_password.tr(),
                    isPassword: true,
                    controller: authCubit.confirmPasswordController,
                  ),
                  SizedBox(height: 30.h),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoadingState) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        );
                      } else if (state is AuthSuccessState) {
                        context.pop(); // Close loading dialog
                        context.pushNamedAndRemoveUntil(Routes.bottomNavBarScreen);
                      } else if (state is AuthErrorState) {
                        context.pop(); // Close loading dialog
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Register Error'),
                            content: Text("Failed to create account. Please try again."),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        onTap: () {
                          authCubit.register();
                        },
                        title: LocaleKeys.register.tr(),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.already_have_account.tr(),
                        style: AppTextStyle.text15Regular,
                      ),
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          LocaleKeys.login_now.tr(),
                          style: AppTextStyle.text15Regular.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
