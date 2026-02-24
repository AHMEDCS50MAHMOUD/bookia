
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_back_button.dart';
import 'package:bookia/core/widgets/app_text_form_field.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:bookia/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 22.0.w,vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            AppBackButton(),
              SizedBox(height: 28.h,),
              Text(LocaleKeys.welcome_back_glad_to_see_you_Again.tr(),
              style: AppTextStyle.text30Regular,
              ),
              SizedBox(height: 32.h,),
              AppTextFormField(labelText:LocaleKeys.enter_your_email.tr(),),
              SizedBox(height: 15.h,),
              AppTextFormField(labelText:LocaleKeys.enter_your_password.tr(),),
            ],
          ),
        ),
      ),
    );
  }
}
