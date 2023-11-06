import 'package:flutter/material.dart';
import 'package:pretty_notch/src/notch_calculator.dart';

import 'notch_type.dart';

class PrettyNotch extends StatefulWidget {
  const PrettyNotch({
    required this.child,
    super.key,
    required this.longNotch,
    required this.shortNotch,
    required this.dynamicIsland,
  });

  final Widget child;

  final Widget longNotch;

  final Widget shortNotch;

  final Widget dynamicIsland;

  @override
  State<PrettyNotch> createState() => _PrettyNotchState();
}

class _PrettyNotchState extends State<PrettyNotch> {
  late final Future<IosNotchType> notch;
  final bodyKey = UniqueKey();
  @override
  void initState() {
    notch = getNotchType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return KeyedSubtree(key: bodyKey, child: widget.child);
        } else {
          return Stack(
            children: [
              Positioned.fill(
                child: KeyedSubtree(
                  key: bodyKey,
                  child: widget.child,
                ),
              ),
              FutureBuilder(
                future: notch,
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  }

                  return switch (snapshot.data!) {
                    IosNotchType.dynamicIsland => Positioned(
                        top: 12,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 35,
                                    maxWidth: 120,
                                  ),
                                  child: widget.dynamicIsland),
                            ),
                          ],
                        ),
                      ),
                    IosNotchType.longNotch => Positioned(
                        top: 5,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 26,
                                    maxWidth: 150,
                                  ),
                                  child: widget.shortNotch),
                            ),
                          ],
                        ),
                      ),
                    IosNotchType.littleNotch => Positioned(
                        top: 5,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight: 26,
                                    maxWidth: 111,
                                  ),
                                  child: widget.shortNotch),
                            ),
                          ],
                        ),
                      ),
                    IosNotchType.noting => const SizedBox.shrink(),
                  };
                }),
              )
            ],
          );
        }
      },
    );
  }
}