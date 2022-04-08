import 'package:app/features/login/authorization_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_manager.freezed.dart';

class LoginManager extends Cubit<LoginViewState> {
  LoginManager(this.authCubit) : super(const LoginViewState.login(null));

  final AuthorizationManager authCubit;

  void submit_login_data(String email, String password) {
    final emailRegex = RegExp(".+@.+");
    if (!emailRegex.hasMatch(email)) {
      emit(const LoginViewState.login("Not a valid email"));
      return;
    }
    if (password.length < 8) {
      emit(const LoginViewState.login(
          "The password has to be longer than 8 characters"));
      return;
    }

    // TODo contact endpoint for secret
    final secret = "asd";

    authCubit.login(secret);
  }

  void submit_register_data(String email, String password, String passwordtwo) {
    final emailRegex = RegExp(".+@.+");
    if (!emailRegex.hasMatch(email)) {
      emit(const LoginViewState.register("Not a valid email"));
      return;
    }
    if (password != passwordtwo) {
      emit(const LoginViewState.register("Passwords don't match"));
      return;
    }
    if (password.length < 8) {
      emit(const LoginViewState.register(
          "The password has to be longer than 8 characters"));
      return;
    }
    print("got here!");

    // TODo contact endpoint for secret
    final secret = "asd";
    authCubit.login(secret);
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
