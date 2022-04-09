import 'package:app/features/branding/bbar.dart';
import 'package:app/features/card_view/nomore.dart';
import 'package:app/features/favourites/fav_manager.dart';
import 'package:app/features/favourites/shortcard.dart';
import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewRoute extends MaterialPageRoute<void> {
  FavViewRoute(AuthorizationManager manager)
      : super(
          builder: (context) => BlocProvider.value(
            value: manager,
            child: const FavView(),
          ),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position:
            Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(CurveTween(curve: Curves.easeIn).animate(animation)),
        child: child);
  }
}

class FavView extends StatelessWidget {
  const FavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: C.secondaryLight,
      body: BlocProvider(
        create: (context) =>
            FavouritesManager(authman: context.read<AuthorizationManager>())
              ..fetch(),
        child: BlocBuilder<FavouritesManager, FavouritesState>(
          builder: (context, state) => state.map(
            loading: (_) => Container(
              color: C.secondary,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your liked",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(color: C.primary),
                      ),
                    ),
                    const BBar(),
                  ],
                ),
              ),
            ),
            ready: (s) {
              if (s.data.isEmpty) {
                return SafeArea(
                  child: Column(
                    children: const [
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your liked",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Spacer(flex: 1),
                      Expanded(child: NoMore(text: "No liked events!")),
                      Spacer(flex: 1),
                      BBar(),
                    ],
                  ),
                );
              }
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            children: <Widget>[
                                  const SizedBox(height: 16),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Your liked",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                ] +
                                List<int>.generate(s.data.length, (i) => i)
                                    .map((dd) => ShortCardWidget(
                                          data: s.data[dd],
                                          key: Key(
                                            dd.toString(),
                                          ),
                                        ))
                                    .toList()
                                    .reversed
                                    .toList()
                                    .spacedWith(const SizedBox(
                                      height: 16,
                                    ))),
                      ),
                    ),
                    const BBar()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
