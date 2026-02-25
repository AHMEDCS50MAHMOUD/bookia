// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "hello": "مرحبا",
  "on_boarding_statement": "اطلب كتابك الآن!",
  "login": "تسجيل الدخول",
  "register": "إنشاء حساب ",
  "Welcome back! Glad to see you, Again!": " مرحبًا بعودتك! سعيد برؤيتك مرة أخرى!"
};
static const Map<String,dynamic> _en = {
  "hello": "Hallo",
  "on_boarding_statement": "Order Your Book Now!",
  "login": "Login",
  "register": "Register ",
  "Welcome back! Glad to see you, Again!": "Welcome back! Glad to see you, Again! "
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
