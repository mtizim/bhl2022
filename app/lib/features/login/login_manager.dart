import 'dart:convert';

import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_manager.freezed.dart';

class LoginManager extends Cubit<LoginViewState> {
  LoginManager(this.authCubit) : super(const LoginViewState.login(null));

  final AuthorizationManager authCubit;

  Future<bool> submitLoginData(String email, String password) async {
    final emailRegex = RegExp(".+@.+");
    if (!emailRegex.hasMatch(email)) {
      emit(const LoginViewState.login("Not a valid email"));
      return false;
    }
    if (password.length < 8) {
      emit(const LoginViewState.login(
          "The password has to be longer than 8 characters"));
      return false;
    }

    final response = await http.post(
      Uri.tryParse(C.serverAddress + '/token')!,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 400) {
      emit(const LoginViewState.login("Bad login"));
      return false;
    }
    if (response.statusCode != 200) {
      return false;
    }

    final secret = jsonDecode(response.body)['access_token']!;

    authCubit.login(secret);
    emit(const LoginViewState.login(null));
    return true;
  }

  Future<bool> submitRegisterData(
      String email, String password, String passwordtwo) async {
    final emailRegex = RegExp(".+@.+");
    if (!emailRegex.hasMatch(email)) {
      emit(const LoginViewState.register("Not a valid email", false));
      return false;
    }
    if (password != passwordtwo) {
      emit(const LoginViewState.register("Passwords don't match", false));
      return false;
    }
    if (password.length < 8) {
      emit(const LoginViewState.register(
          "The password has to be longer than 8 characters", false));
      return false;
    }
    emit(const LoginViewState.register(null, true));

    final response = await http.post(
      Uri.tryParse(C.serverAddress + '/register')!,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {"username": email, "password": password},
    );

    if (response.statusCode == 409) {
      emit(const LoginViewState.register("User already exists", false));
      return false;
    }
    if (response.statusCode != 200) {
      return false;
    }
    await Future<void>.delayed(const Duration(milliseconds: 500));
    await submitLoginData(email, password);
    emit(const LoginViewState.register(null, false));
    return true;
  }

  void goToLogin() {
    emit(const LoginViewState.login(null));
  }

  void goToRegister(String email, String password) {
    emit(const LoginViewState.register(null, false));
  }
}

@freezed
class LoginViewState with _$LoginViewState {
  const factory LoginViewState.login(String? error) = LoginLoginViewState;
  const factory LoginViewState.register(String? error, bool loading) =
      RegisterViewState;
}
