import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_manager.freezed.dart';

class AuthorizationManager extends Cubit<LoginState> {
  AuthorizationManager() : super(const LoginState.unknown());

  void tryAutologin() async {
    // TODO read secret from local storage
    await Future<void>.delayed(const Duration(milliseconds: 100));
    emit(const LoginState.loggedIn("asd"));
    // emit(const LoginState.loggedOut("asd"));
  }

  void login(String secret) {
    // TODO contact endpoint
    // TODO save secret on log in

    emit(LoginState.loggedIn(secret));
  }

  void logout() {
    // TODO contact endpoint
    // TODO clear secret

    emit(const LoginState.loggedOut(null));
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.unknown() = UnknownLoginState;
  const factory LoginState.loggedOut(String? reason) = LoggedOutState;
  const factory LoginState.loggedIn(String secret) = LoggedInState;
}
