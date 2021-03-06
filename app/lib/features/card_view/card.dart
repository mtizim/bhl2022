import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/helpers/round_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CardData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: C.borderradiustwo,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: C.borderradiusone,
                    child: Container(
                      height: 270,
                      width: double.infinity,
                      color: C.secondaryLighter,
                      child: CachedNetworkImage(
                        fit: BoxFit.fitWidth,
                        imageUrl: data.imageLink.toString(),
                        placeholder: (context, url) => Center(
                            child:
                                CircularProgressIndicator(color: C.tertiary)),
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
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(data.address),
                  if (data.timeStart != null)
                    Row(
                      children: [
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 45,
                          child: Text("From:"),
                        ),
                        Text(DateFormat('yyyy-MM-dd ??? kk:mm')
                            .format(data.timeStart!)),
                      ],
                    ),
                  if (data.timeEnd != null)
                    if (data.timeStart != null)
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          const SizedBox(
                            width: 45,
                            child: Text("To:"),
                          ),
                          Text(DateFormat('yyyy-MM-dd ??? kk:mm')
                              .format(data.timeEnd!)),
                        ],
                      ),
                  const SizedBox(height: 4),
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 4,
                    spacing: 2,
                    children: data.tags
                        .map((tag) => RContainer(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              color: C.fifth,
                              child: Text(
                                tag,
                                style: TextStyle(color: C.secondaryLighter),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 8),
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
                  RContainer(height: 2, color: C.primary),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (rect) => LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black.withOpacity(0.0)],
                      ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height)),
                      blendMode: BlendMode.dstIn,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Text(
                            data.description,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(0.5),
                        child: Icon(
                          Icons.undo,
                          color: C.fourth.withOpacity(0.3),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.north,
                        color: C.fourth.withOpacity(0.3),
                      ),
                      const Spacer(),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.1415)
                            .multiplied(Matrix4.rotationZ(0.5)),
                        child: Icon(
                          Icons.undo,
                          color: C.fourth.withOpacity(0.3),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
