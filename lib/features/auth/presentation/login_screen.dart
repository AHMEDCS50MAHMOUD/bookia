import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_back_button.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/home/presentation/home_screen.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
@override
  void dispose() {
  emailController.dispose();
  passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              AppBackButton(),
              SizedBox(height: 28.h,),
              Text(LocaleKeys.welcome_back_glad_to_see_you_Again.tr(),
                style: AppTextStyle.text30Regular,
              ),
              SizedBox(height: 32.h,),
              AppTextFormField(
                controller: emailController,
                labelText: LocaleKeys.enter_your_email.tr(),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 15.h,),
              AppTextFormField(
                controller: passwordController,
                labelText: LocaleKeys.enter_your_password.tr(),
                isPassword: true,

              ),
              SizedBox(height: 62.h,),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if(state is AuthLoadingState){
                    showDialog(
                        barrierDismissible: false,
                        context: context, builder: (context)=>Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ));
                  }
                  else if(state is AuthErrorState){
                  context.pop();
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Error!"),
                        content: Text("Something wrong !"),
                      );

                    });
                  }
                  else if(state is AuthSuccessState){
                    context.pushNamedAndRemoveUntil(Routes.homeScreen);

                  }

                },
                child: AppButton(title: LocaleKeys.login.tr(),
                  onTap: () {
                  
                  context.read<AuthCubit>().login(email: emailController.text,
                     password: passwordController.text);

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
