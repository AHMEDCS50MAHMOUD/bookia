import 'package:bookia/core/networking/api_constant.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static Future<bool> login({required String email, required String password}) async {
    try {
      final response = await DioFactory.dio?.post(ApiConstant.login, data: {
        "email": email,
        "password": password,
      });
      if (response?.statusCode == 200) {
        await saveToken(response?.data["data"]["token"].toString() ?? "");
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  static Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await DioFactory.dio?.post(ApiConstant.register, data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });
      if (response?.statusCode == 201 || response?.statusCode == 200) {
        await saveToken(response?.data["data"]["token"].toString() ?? "");
        return true;
      } else {
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  static saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
