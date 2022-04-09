import 'package:app/features/login/login_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/helpers/round_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterForm extends HookWidget {
  const RegisterForm({
    Key? key,
    required this.emailController,
    required this.pwController,
  }) : super(key: key);

  final TextEditingController pwController;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    final pw2Controller = useTextEditingController();

    const fontStyle = TextStyle(fontSize: 20);

    final pwNode = useFocusNode();
    final pw2Node = useFocusNode();

    return WillPopScope(
      onWillPop: () async {
        context.read<LoginManager>().goToLogin();
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
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 11, bottom: 4),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => pwNode.requestFocus(),
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
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 11, bottom: 4),
                child: TextField(
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => pw2Node.requestFocus(),
                  focusNode: pwNode,
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
                  textInputAction: TextInputAction.done,
                  style: fontStyle,
                  onEditingComplete: () async {
                    final succ =
                        await context.read<LoginManager>().submitRegisterData(
                              emailController.text,
                              pwController.text,
                              pw2Controller.text,
                            );
                    if (succ) {
                      emailController.clear();
                      pwController.clear();
                    }
                  },
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: pw2Controller,
                  obscureText: true,
                  focusNode: pw2Node,
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
                onTap: () async {
                  final succ =
                      await context.read<LoginManager>().submitRegisterData(
                            emailController.text,
                            pwController.text,
                            pw2Controller.text,
                          );
                  if (succ) {
                    emailController.clear();
                    pwController.clear();
                  }
                },
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
      ),
    );
  }
}
