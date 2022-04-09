import 'package:app/features/branding/applogo.dart';
import 'package:app/features/card_view/card_view.dart';
import 'package:app/features/login/authorization_manager.dart';
import 'package:app/features/login/auths_screen.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<AuthorizationManager, LoginState>(
          builder: (context, state) => state.map(
<<<<<<< HEAD
            unknown: (_) => Container(
              height: double.infinity,
              width: double.infinity,
              color: C.primary,
              child: const Center(child: AppLogo()),
=======
            unknown: (_) => Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                color: C.primary,
                child: const Center(child: AppLogo()),
              ),
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
            ),
            loggedOut: (_) => Container(
              height: double.infinity,
              width: double.infinity,
              color: C.secondary,
              child: Center(
                child: CircularProgressIndicator(color: C.primary),
              ),
            ),
            loggedIn: (_) => CardView(),
          ),
        ),
        BlocBuilder<AuthorizationManager, LoginState>(
<<<<<<< HEAD
          builder: (context, state) => AnimatedOpacity(
            opacity: state.map(
              unknown: (_) => 0,
              loggedOut: (_) => 1,
              loggedIn: (_) => 0,
            ),
            duration: const Duration(milliseconds: 200),
            child: AuthScreen(),
=======
          builder: (context, state) => IgnorePointer(
            ignoring: state.map(
              unknown: (_) => true,
              loggedOut: (_) => false,
              loggedIn: (_) => true,
            ),
            child: AnimatedOpacity(
              opacity: state.map(
                unknown: (_) => 0,
                loggedOut: (_) => 1,
                loggedIn: (_) => 0,
              ),
              duration: const Duration(milliseconds: 200),
              child: AuthScreen(),
            ),
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
          ),
        ),
      ],
    );
  }
}
