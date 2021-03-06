import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/helpers/round_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class ShortCardWidget extends HookWidget {
  const ShortCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CardData data;

  @override
  Widget build(BuildContext context) {
    final rolled = useState(true);

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          rolled.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      secondChild: _Scw(
        data: data,
        rolled: rolled,
        rolledB: false,
      ),
      firstChild: _Scw(
        data: data,
        rolled: rolled,
        rolledB: true,
      ),
    );
  }
}

class _Scw extends StatelessWidget {
  const _Scw({
    Key? key,
    required this.rolled,
    required this.rolledB,
    required this.data,
  }) : super(key: key);

  final CardData data;
  final ValueNotifier<bool> rolled;
  final bool rolledB;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: rolledB ? 320 : 700,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              color: Colors.white,
              elevation: 10,
              borderRadius: C.borderradiustwo,
              child: InkWell(
                onTap: (() => rolled.value = !rolled.value),
                borderRadius: C.borderradiustwo,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: C.borderradiusone,
                        child: Container(
                          height: rolledB ? 130 : 260,
                          width: double.infinity,
                          color: C.secondaryLighter,
                          child: CachedNetworkImage(
                            fit: BoxFit.fitWidth,
                            imageUrl: data.imageLink.toString(),
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                    color: C.tertiary)),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(data.address),
                      if (rolledB) const Spacer(),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 20,
                            child: Stack(
                              children: [
                                ...List.generate(
                                  data.minCapacity,
                                  (i) => Positioned(
                                    left: 6 * i.toDouble(),
                                    child: Icon(
                                      Icons.boy,
                                      size: 20,
                                      color: C.tertiary,
                                    ),
                                  ),
                                ).toList(),
                                Positioned(
                                  left: 8 + 6 * data.minCapacity.toDouble(),
                                  child: Text(
                                    "+",
                                    style: TextStyle(color: C.tertiary),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          RContainer(height: 2, color: C.primary),
                          SizedBox(
                            width: 80,
                            height: 20,
                            child: Stack(
                              children: [
                                ...List.generate(
                                    data.cost,
                                    (i) => Positioned(
                                          right: 6 * i.toDouble(),
                                          child: Icon(
                                            Icons.euro,
                                            size: 20,
                                            color: C.tertiary,
                                          ),
                                        )).toList(),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      !rolledB
                          ? Expanded(
                              child: SizedBox(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        alignment: WrapAlignment.start,
                                        runSpacing: 4,
                                        spacing: 2,
                                        children: data.tags
                                            .map((tag) => RContainer(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 6,
                                                      vertical: 4),
                                                  color: C.fifth,
                                                  child: Text(
                                                    tag,
                                                    style: TextStyle(
                                                        color:
                                                            C.secondaryLighter),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                      const SizedBox(height: 8),
                                      RContainer(height: 2, color: C.primary),
                                      const SizedBox(height: 8),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            data.description,
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 36,
          right: 36,
          child: Material(
            shape: const CircleBorder(),
            color: C.primary,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () => launch(data.launch.toString()),
                child: Icon(
                  Icons.launch,
                  size: 20,
                  color: C.fourth,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          right: 0,
          left: 0,
          child: Center(
            child: Icon(
              rolledB ? Icons.expand_more : Icons.expand_less,
              size: 20,
              color: C.fourth.withOpacity(0.4),
            ),
          ),
        )
      ],
    );
  }
}
