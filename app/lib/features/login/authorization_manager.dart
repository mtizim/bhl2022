import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_manager.freezed.dart';

class AuthorizationManager extends Cubit<LoginState> {
  AuthorizationManager() : super(const LoginState.unknown());

  void tryAutologin() {
    // TODO read secret from local storage
  }

  void login(String secret) {
    // TODO contact endpoint
    // TODO save secret on log in
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.unknown() = UnknownLoginState;
  const factory LoginState.logged_out(String? reason) = LoggedOutState;
  const factory LoginState.logged_in(String secret) = LoggedInState;
}
