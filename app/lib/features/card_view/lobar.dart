import 'package:app/features/favourites/fav_view.dart';
import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LBar extends StatelessWidget {
  const LBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      color: C.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    FavViewRoute(context.read<AuthorizationManager>()),
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
                      size: 30,
                      color: C.fourth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
