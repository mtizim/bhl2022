import 'dart:ui';

import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/helpers/round_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NoMore extends StatelessWidget {
  const NoMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: C.borderradiustwo,
        child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text("No more matches :("),
            )),
      ),
    );
  }
}
