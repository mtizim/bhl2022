import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';

class NoMore extends StatelessWidget {
  const NoMore({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: C.borderradiustwo,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(text),
            )),
      ),
    );
  }
}
