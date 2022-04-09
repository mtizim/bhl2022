import 'package:app/features/favourites/fav_view.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';

class LBar extends StatelessWidget {
  const LBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
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
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                FavViewRoute(),
              ),
              splashColor: C.fifth,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(C.borderradiusone.topLeft.x),
                bottomRight: Radius.circular(C.borderradiusone.topLeft.x),
              ),
              child: SizedBox(
                height: double.infinity,
                width: 74,
                child: Icon(
                  Icons.favorite,
                  size: 26,
                  color: C.fourth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
