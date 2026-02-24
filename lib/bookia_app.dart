import 'package:bookia/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:bookia/features/outh/presentation/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:Size(375, 812) ,
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme:ThemeData(
              fontFamily:"DMSerifDisplay"
          ) ,
          home: OnBoardingScreen(),
        ));
  }
}
