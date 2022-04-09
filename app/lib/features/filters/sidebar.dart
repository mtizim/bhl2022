import 'package:app/features/filters/sidebarmanager.dart';
import 'package:app/features/login/authorization_manager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/helpers/round_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: C.primary,
      child: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<SidebarManager, Filters>(
                    builder: (context, filters) => SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  "Preferences",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 32),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Min Budget",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: C.fourth),
                                ),
                                ClipRRect(
                                  borderRadius: C.borderradiusone,
                                  child: RContainer(
                                    width: double.infinity,
                                    color: C.secondary,
                                    child: Column(
                                      children: FC.moneyValues
                                          .map(
                                            (money) => Material(
                                              color: (money == filters.minMoney)
                                                  ? C.fifth
                                                  : C.secondaryLighter,
                                              child: InkWell(
                                                onTap: () => context
                                                    .read<SidebarManager>()
                                                    .chooseMinMoney(money),
                                                splashColor: C.fourth,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(width: 4),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 80,
                                                      child: Stack(
                                                        children: [
                                                          ...List.generate(
                                                            money,
                                                            (i) => Positioned(
                                                              top: 6,
                                                              right: 7 *
                                                                  i.toDouble(),
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.euro,
                                                                  size: 25,
                                                                  color: C
                                                                      .tertiary,
                                                                ),
                                                              ),
                                                            ),
                                                          ).toList(),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(FC.moneyDescriptions[
                                                        money]!),
                                                    const SizedBox(width: 8),
                                                  ].reversed.toList(),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  "Max Budget",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: C.fourth),
                                ),
                                ClipRRect(
                                  borderRadius: C.borderradiusone,
                                  child: RContainer(
                                    width: double.infinity,
                                    color: C.secondary,
                                    child: Column(
                                      children: FC.moneyValues
                                          .map(
                                            (money) => Material(
                                              color: (money == filters.maxMoney)
                                                  ? C.fifth
                                                  : C.secondaryLighter,
                                              child: InkWell(
                                                onTap: () => context
                                                    .read<SidebarManager>()
                                                    .chooseMaxMoney(money),
                                                splashColor: C.fourth,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(width: 4),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 80,
                                                      child: Stack(
                                                        children: [
                                                          ...List.generate(
                                                            money,
                                                            (i) => Positioned(
                                                              top: 6,
                                                              right: 7 *
                                                                  i.toDouble(),
                                                              child: Icon(
                                                                Icons.euro,
                                                                size: 25,
                                                                color:
                                                                    C.tertiary,
                                                              ),
                                                            ),
                                                          ).toList(),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(FC.moneyDescriptions[
                                                        money]!),
                                                    const SizedBox(width: 8),
                                                  ].reversed.toList(),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  "Group",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: C.fourth),
                                ),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: C.borderradiusone,
                                  child: RContainer(
                                    width: double.infinity,
                                    color: C.secondary,
                                    child: Column(
                                      children: FC.personValues
                                          .map(
                                            (people) => Material(
                                              color: (people == filters.persons)
                                                  ? C.fifth
                                                  : C.secondaryLighter,
                                              child: InkWell(
                                                onTap: () => context
                                                    .read<SidebarManager>()
                                                    .chooseGroupSize(people),
                                                splashColor: C.fourth,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(width: 2),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 80,
                                                      child: Stack(
                                                        children: [
                                                          ...List.generate(
                                                            people,
                                                            (i) => Positioned(
                                                              top: 4,
                                                              right: 6 *
                                                                  i.toDouble(),
                                                              child: Icon(
                                                                Icons.boy,
                                                                size: 25,
                                                                color:
                                                                    C.tertiary,
                                                              ),
                                                            ),
                                                          ).toList(),
                                                        ],
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(FC.personDescriptions[
                                                        people]!),
                                                    const SizedBox(width: 8),
                                                  ].reversed.toList(),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  color: C.fourth,
                  borderRadius: C.borderradiusone,
                  child: InkWell(
                    borderRadius: C.borderradiusone,
                    splashColor: C.fifth,
                    onTap: () => context.read<AuthorizationManager>().logout(),
                    child: SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Log out",
                          style: TextStyle(color: C.secondary),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
