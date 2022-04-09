import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorization_manager.freezed.dart';

class AuthorizationManager extends Cubit<LoginState> {
  AuthorizationManager() : super(const LoginState.unknown());

  void tryAutologin() async {
    // TODO read secret from local storage
<<<<<<< HEAD
    await Future<void>.delayed(const Duration(seconds: 3));
    emit(const LoginState.loggedOut(null));
=======
    await Future<void>.delayed(const Duration(milliseconds: 100));
    emit(const LoginState.loggedIn("asd"));
    // emit(const LoginState.loggedOut("asd"));
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
  }

  void login(String secret) {
    // TODO contact endpoint
    // TODO save secret on log in

    emit(LoginState.loggedIn(secret));
<<<<<<< HEAD
=======
  }

  void logout() {
    // TODO contact endpoint
    // TODO clear secret

    emit(const LoginState.loggedOut(null));
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.unknown() = UnknownLoginState;
  const factory LoginState.loggedOut(String? reason) = LoggedOutState;
  const factory LoginState.loggedIn(String secret) = LoggedInState;
}
