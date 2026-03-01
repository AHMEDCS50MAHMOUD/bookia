import 'package:bookia/core/helper/extentions.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/app_button.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/login_screen.dart';
import 'package:bookia/gen/assets.gen.dart';
import 'package:bookia/gen/locale_keys.g.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: Assets.images.spalashBackGround.image().image,
          fit: BoxFit.cover)
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w),
          child: Column(

            children: [
              SizedBox(height: 50.h,),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        if(context.locale.languageCode=="ar"){
                          context.setLocale(Locale('en'));

                        }else{
                          context.setLocale(Locale('ar'));}
                      },child: Icon(Icons.language)),
                ],
              ),
              SizedBox(height: 100.h,),
              Assets.images.logo.image(),
             SizedBox(height: 28.h,),

              Text(LocaleKeys.on_boarding_statement.tr(),
                  style: AppTextStyle.text20Regular,

              ),
              Spacer(),
              AppButton(title: LocaleKeys.login.tr(),
              onTap: (){
                context.pushNamed(Routes.loginScreen);
              },
              ),
              SizedBox(height: 15.h,),
              AppButton(title: LocaleKeys.register.tr(),
              backgroundColor: Colors.white,
              )

              ,SizedBox(height: 94.h,)

            ],
          ),
        ),
      ),
    );
  }
}
