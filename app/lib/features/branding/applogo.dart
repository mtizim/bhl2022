import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 72),
      child: const Text(
        "LOGO",
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}
