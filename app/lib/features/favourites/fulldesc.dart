import 'package:app/features/card_view/cardmanager.dart';
import 'package:flutter/material.dart';

class FullDescRoute extends MaterialPageRoute<void> {
  FullDescRoute(CardData data) : super(builder: (_) => FullDesc(data: data));
}

class FullDesc extends StatelessWidget {
  const FullDesc({Key? key, required this.data}) : super(key: key);

  final CardData data;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
