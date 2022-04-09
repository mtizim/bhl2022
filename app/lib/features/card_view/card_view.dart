import 'dart:math';

import 'package:app/features/card_view/card.dart';
import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/features/card_view/lobar.dart';
import 'package:app/features/card_view/nomore.dart';
import 'package:app/features/filters/sidebar.dart';
import 'package:app/features/filters/sidebarmanager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:url_launcher/url_launcher.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SidebarManager(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: C.secondaryLight,
        drawer: const Sidebar(),
        body: BlocProvider(
          create: (ctx) =>
              CardManager()..fetch(ctx.read<SidebarManager>().state),
          child: BlocListener<SidebarManager, Filters>(
            listener: (context, state) =>
                context.read<CardManager>().fetch(state),
            child: Builder(
                builder: (context) => SafeArea(
                      bottom: false,
                      child: SizedBox(
                        child: BlocBuilder<CardManager, CardManagerState>(
                          builder: (context, state) => state.map(
                            loading: (_) => Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: C.secondary,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          color: C.primary),
                                    ),
                                  ),
                                ),
                                const LBar()
                              ],
                            ),
                            loaded: (s) => Column(
                              children: [
                                Expanded(
                                  child: SwipableStack(
                                    detectableSwipeDirections: const {
                                      SwipeDirection.left,
                                      SwipeDirection.right,
                                      SwipeDirection.up,
                                    },
                                    overlayBuilder: (context, properties) {
                                      final direction = properties.direction;

                                      final magnitude = Curves.easeIn.transform(
                                          (properties.swipeProgress / 5)
                                              .clamp(0, 1));

                                      if (direction == SwipeDirection.left) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red
                                                    .withOpacity(magnitude),
                                                borderRadius:
                                                    C.borderradiustwo),
                                            child: Align(
                                              alignment:
                                                  const Alignment(0, -0.4),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.red.withOpacity(
                                                    (magnitude * 8)
                                                        .clamp(0, 1)),
                                                size: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      if (direction == SwipeDirection.right) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green
                                                    .withOpacity(magnitude),
                                                borderRadius:
                                                    C.borderradiustwo),
                                            child: Align(
                                              alignment:
                                                  const Alignment(0, -0.4),
                                              child: Icon(
                                                Icons.check,
                                                size: 60,
                                                color: Colors.green.withOpacity(
                                                    (magnitude * 8)
                                                        .clamp(0, 1)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      if (direction == SwipeDirection.up) {
                                        return Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: C.primary.withOpacity(
                                                    (magnitude * 2)
                                                        .clamp(0, 1)),
                                                borderRadius:
                                                    C.borderradiustwo),
                                            child: Align(
                                              alignment:
                                                  const Alignment(0, -0.1),
                                              child: Icon(
                                                Icons.launch,
                                                size: 60,
                                                color: C.fourth.withOpacity(
                                                    (magnitude * 8)
                                                        .clamp(0, 1)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                    onSwipeCompleted: (index, direction) {
                                      final cubit = context.read<CardManager>();
                                      if (direction == SwipeDirection.left) {
                                        cubit.uninterested(index);
                                      }
                                      if (direction == SwipeDirection.right) {
                                        cubit.interested(index);
                                      }
                                      if (direction == SwipeDirection.up) {
                                        cubit.interested(index);
                                        launch(s.data[index].launch.toString());
                                      }
                                    },
                                    builder: (context, properties) {
                                      final idx = properties.index;

                                      return (idx < s.data.length)
                                          ? CardWidget(data: s.data[idx])
                                          : const NoMore();
                                    },
                                  ),
                                ),
                                const LBar()
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
