import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_manager.freezed.dart';

class AuthorizationManager extends Cubit<LoginState> {
  AuthorizationManager() : super(const LoginState.unknown());
  final storage = const FlutterSecureStorage();

  void tryAutologin() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final token = await storage.read(key: "apiToken");
    if (token != null) {
      emit(LoginState.loggedIn(token));
    } else {
      emit(const LoginState.loggedOut(null));
    }
  }

  void login(String secret) async {
    await storage.write(key: "apiToken", value: secret);
    emit(LoginState.loggedIn(secret));
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void logout() async {
    await storage.delete(key: 'apiToken');
    emit(const LoginState.loggedOut(null));
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.unknown() = UnknownLoginState;
  const factory LoginState.loggedOut(String? reason) = LoggedOutState;
  const factory LoginState.loggedIn(String secret) = LoggedInState;
}
