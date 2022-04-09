import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/features/branding/applogo.dart';
import 'package:app/features/login/register_form.dart';
import 'package:app/features/login/login_manager.dart';
import 'package:app/features/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pwController = useTextEditingController();
    final emailController = useTextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  const SizedBox(
                    height: 72,
                  ),
                  const AppLogo(),
                  const Spacer(),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: state.map(
                      login: (_) => LoginForm(
                        pwController: pwController,
                        emailController: emailController,
                      ),
                      register: (_) => RegisterForm(
                        pwController: pwController,
                        emailController: emailController,
                      ),
                    ),
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
