import 'package:app/features/card_view/card.dart';
import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/features/card_view/lobar.dart';
import 'package:app/features/filters/sidebar.dart';
import 'package:app/features/filters/sidebarmanager.dart';
import 'package:app/helpers/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipable_stack/swipable_stack.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SidebarManager(),
      child: Scaffold(
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
                            loading: (_) => Container(
                              color: C.secondary,
                              child: Center(
                                child:
                                    CircularProgressIndicator(color: C.primary),
                              ),
                            ),
                            loaded: (s) => Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 116,
                                  width: MediaQuery.of(context).size.width,
                                  child: SwipableStack(
                                    detectableSwipeDirections: const {
                                      SwipeDirection.left,
                                      SwipeDirection.right,
                                    },
                                    onSwipeCompleted: (index, direction) {
                                      final cubit = context.read<CardManager>();
                                      if (direction == SwipeDirection.left) {
                                        cubit.uninterested(index);
                                      }
                                      if (direction == SwipeDirection.right) {
                                        cubit.interested(index);
                                      }
                                    },
                                    builder: (context, properties) {
                                      final idx = properties.index;
                                      final interested = properties.direction ==
                                          SwipeDirection.right;
                                      final uninterested =
                                          properties.direction ==
                                              SwipeDirection.left;

                                      final magnitude = properties.stackIndex ==
                                              0
                                          ? properties.swipeProgress / 6 - 0.1
                                          : 0.0;
                                      return Stack(
                                        children: [
                                          CardWidget(data: s.data[idx]),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: interested
                                                    ? Colors.green.withOpacity(
                                                        Curves.easeIn.transform(
                                                            magnitude.clamp(
                                                                0, 1)))
                                                    : uninterested
                                                        ? Colors.red
                                                            .withOpacity(Curves
                                                                .easeIn
                                                                .transform(
                                                                    magnitude
                                                                        .clamp(
                                                                            0,
                                                                            1)))
                                                        : null,
                                                borderRadius: C.borderradiustwo,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const Spacer(),
                                const SizedBox(
                                  height: 64,
                                  child: LBar(),
                                )
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
