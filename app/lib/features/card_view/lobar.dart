import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';

class LBar extends StatelessWidget {
  const LBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: C.primary,
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              splashColor: C.fifth,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(C.borderradiusone.topLeft.x),
                bottomRight: Radius.circular(C.borderradiusone.topLeft.x),
              ),
              child: SizedBox(
                height: double.infinity,
                width: 74,
                child: Icon(
                  Icons.menu,
                  size: 26,
                  color: C.fourth,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
