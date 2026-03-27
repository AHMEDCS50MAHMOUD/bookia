import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoadingState());
    final success = await AuthRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (success) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token != null) {
        DioFactory.setTokenAfterLogin(token);
      }
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }
}
