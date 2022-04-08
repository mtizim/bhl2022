import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_manager.freezed.dart';

class LoginManager extends Cubit<LoginViewState> {
  LoginManager() : super(const LoginViewState.login(null));

  void submit_register_data(String email, String password) {
    // TODo contact endpoint
  }
  void submit_login_data(String email, String password) {
    // TODo contact endpoint
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
