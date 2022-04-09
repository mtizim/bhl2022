import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/features/branding/applogo.dart';
import 'package:app/features/login/register_form.dart';
import 'package:app/features/login/login_manager.dart';
import 'package:app/features/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider(
        create: (c) => LoginManager(c.read<AuthorizationManager>()),
        child: BlocBuilder<LoginManager, LoginViewState>(
            builder: (context, state) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              color: C.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
<<<<<<< HEAD
=======
                  const SizedBox(
                    height: 72,
                  ),
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
                  const AppLogo(),
                  const Spacer(),
                  state.map(
                    login: (_) => LoginForm(),
                    register: (_) => RegisterForm(),
                  ),
                  const Spacer(flex: 3)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
