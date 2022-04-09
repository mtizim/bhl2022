import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';

class BBar extends StatelessWidget {
  const BBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        width: double.infinity,
        height: 64,
        color: C.primary,
        child: Row(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                splashColor: C.fifth,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(C.borderradiusone.topLeft.x),
                  bottomRight: Radius.circular(C.borderradiusone.topLeft.x),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 74,
                  child: Icon(
                    Icons.arrow_back,
                    size: 26,
                    color: C.fourth,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
