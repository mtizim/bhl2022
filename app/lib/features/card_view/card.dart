import 'dart:ui';

import 'package:app/features/card_view/cardmanager.dart';
import 'package:app/helpers/consts.dart';
import 'package:app/helpers/round_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        color: C.secondaryLight,
        elevation: 10,
        borderRadius: C.borderradiustwo,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: C.borderradiusone,
                child: Container(
                  height: 270,
                  width: double.infinity,
                  color: C.secondaryLighter,
                  child: CachedNetworkImage(
                    imageUrl: data.imageLink.toString(),
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(color: C.tertiary)),
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
              const SizedBox(height: 4),
              Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 4,
                spacing: 2,
                children: data.tags
                    .map((tag) => RContainer(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          color: C.fifth,
                          child: Text(
                            tag,
                            style: TextStyle(color: C.secondary),
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
                child: SingleChildScrollView(
                  child: Text(
                    data.description,
                    style: const TextStyle(fontSize: 18),
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
