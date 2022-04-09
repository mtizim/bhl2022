import 'dart:developer';

import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_manager.freezed.dart';

class LoginManager extends Cubit<LoginViewState> {
  LoginManager(this.authCubit) : super(const LoginViewState.login(null));

  final AuthorizationManager authCubit;

  Future<bool> submit_login_data(String email, String password) async {
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

    // TODo contact endpoint for secret
    final secret = "asd";
    //   curl -X 'POST' \
    // 'https://eventful1.herokuapp.com/token' \
    // -H 'accept: application/json' \
    // -H 'Content-Type: application/x-www-form-urlencoded' \
    // -d 'grant_type=&username=uname&password=password&scope=&client_id=&client_secret='
    final response = await http.post(
      Uri.tryParse(C.serverAddress + '/token')!,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {"username": email, "password": password},
    );

    inspect(response);

    // authCubit.login(secret);
    // emit(const LoginViewState.login(null));
    return false;
  }

  Future<bool> submit_register_data(
      String email, String password, String passwordtwo) async {
    final emailRegex = RegExp(".+@.+");
    if (!emailRegex.hasMatch(email)) {
      emit(const LoginViewState.register("Not a valid email"));
      return false;
    }
    if (password != passwordtwo) {
      emit(const LoginViewState.register("Passwords don't match"));
      return false;
    }
    if (password.length < 8) {
      emit(const LoginViewState.register(
          "The password has to be longer than 8 characters"));
      return false;
    }
    print("got here!");

    // TODo contact endpoint for secret
    final secret = "asd";

    authCubit.login(secret);
    emit(const LoginViewState.register(null));
    return true;
  }

  void go_to_login() {
    emit(const LoginViewState.login(null));
  }

  void go_to_register(String email, String password) {
    emit(const LoginViewState.register(null));
  }
}

@freezed
class LoginViewState with _$LoginViewState {
  const factory LoginViewState.login(String? error) = LoginLoginViewState;
  const factory LoginViewState.register(String? error) = RegisterViewState;
}
