import 'package:bookia/bookia_app.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("token");
  String? token = prefs.getString('token');

  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    EasyLocalization.ensureInitialized()
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: BookiaApp(
         token: token,

        ),
      ),
    ),
  );
}



// dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart -O lib/gen
//flutter pub run build_runner build --delete-conflicting-outputs