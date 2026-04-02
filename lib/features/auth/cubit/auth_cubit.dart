import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    emailController.text = "Ahmed2006@gmail.com";
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  Future<void> register() async {
    emit(AuthLoadingState());
    final success = await AuthRepo.register(
      name: userNameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
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
