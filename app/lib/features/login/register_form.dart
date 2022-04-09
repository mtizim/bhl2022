import 'package:app/features/login/authorization_manager.dart';
import 'package:app/features/login/login_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../helpers/round_container.dart';

class RegisterForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final pwController = useTextEditingController();
    final pw2Controller = useTextEditingController();
    final emailController = useTextEditingController();

    const fontStyle = TextStyle(fontSize: 20);

<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 64,
        vertical: 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              "Email:",
              style: TextStyle(color: C.secondary),
            ),
          ),
          const SizedBox(height: 4),
          RContainer(
            color: C.secondary,
            height: 44,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: fontStyle,
                controller: emailController,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              "Password:",
              style: TextStyle(color: C.secondary),
            ),
          ),
          const SizedBox(height: 4),
          RContainer(
            color: C.secondary,
            height: 44,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: fontStyle,
                controller: pwController,
                decoration: const InputDecoration(border: InputBorder.none),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              "Repeat password:",
              style: TextStyle(color: C.secondary),
            ),
          ),
          const SizedBox(height: 4),
          RContainer(
            color: C.secondary,
            height: 44,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: fontStyle,
                decoration: const InputDecoration(border: InputBorder.none),
                controller: pw2Controller,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<LoginManager, LoginViewState>(
                  builder: (context, state) {
                return Text(
                  state.map(login: (s) => s.error, register: (s) => s.error) ??
                      "",
                  style: TextStyle(color: C.tertiary),
                  textAlign: TextAlign.center,
                );
              }),
            ),
          ),
          Material(
            color: C.tertiary,
            borderRadius: C.borderradiusone,
            child: InkWell(
              onTap: () => context.read<LoginManager>().submit_register_data(
                    emailController.text,
                    pwController.text,
                    pw2Controller.text,
                  ),
              borderRadius: C.borderradiusone,
              splashColor: C.fourth,
              child: RContainer(
                height: 60,
                child: Center(
                    child: Text(
                  "Register",
                  style: TextStyle(color: C.secondary, fontSize: 16),
                )),
                width: double.infinity,
              ),
            ),
          ),
        ],
=======
    return WillPopScope(
      onWillPop: () async {
        context.read<LoginManager>().go_to_login();
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 64,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Email:",
                style: TextStyle(color: C.secondary),
              ),
            ),
            const SizedBox(height: 4),
            RContainer(
              color: C.secondary,
              height: 44,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: fontStyle,
                  controller: emailController,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Password:",
                style: TextStyle(color: C.secondary),
              ),
            ),
            const SizedBox(height: 4),
            RContainer(
              color: C.secondary,
              height: 44,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: fontStyle,
                  controller: pwController,
                  decoration: const InputDecoration(border: InputBorder.none),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "Repeat password:",
                style: TextStyle(color: C.secondary),
              ),
            ),
            const SizedBox(height: 4),
            RContainer(
              color: C.secondary,
              height: 44,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: fontStyle,
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: pw2Controller,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: Align(
                alignment: Alignment.center,
                child: BlocBuilder<LoginManager, LoginViewState>(
                    builder: (context, state) {
                  return Text(
                    state.map(
                            login: (s) => s.error, register: (s) => s.error) ??
                        "",
                    style: TextStyle(color: C.tertiary),
                    textAlign: TextAlign.center,
                  );
                }),
              ),
            ),
            Material(
              color: C.tertiary,
              borderRadius: C.borderradiusone,
              child: InkWell(
                onTap: () => context.read<LoginManager>().submit_register_data(
                      emailController.text,
                      pwController.text,
                      pw2Controller.text,
                    ),
                borderRadius: C.borderradiusone,
                splashColor: C.fourth,
                child: RContainer(
                  height: 60,
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(color: C.secondary, fontSize: 16),
                  )),
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
>>>>>>> 27fe72958701c08a555ae80cb3cccbcc0ec5d6c2
      ),
    );
  }
}
