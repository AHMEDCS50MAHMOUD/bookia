import 'package:bookia/core/routing/app_router.dart';
import 'package:bookia/core/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  final String? token;
  const BookiaApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(fontFamily: "DMSerifDisplay"),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: startRoute(),
        );
      },
    );
  }

  String startRoute() {
    if (token == null) {
      return Routes.onBoardingScreen;
    } else {
      return Routes.bottomNavBarScreen;
    }
  }
}
