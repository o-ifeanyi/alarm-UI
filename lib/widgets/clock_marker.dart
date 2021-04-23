import 'dart:math';

import 'package:flutter/material.dart';

class ClockMarker extends StatelessWidget {
  final Alignment alignment;
  final int second;

  ClockMarker({this.alignment, this.second});
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: alignment,
      transform: Matrix4.identity()
        ..translate(-2 / 2, -20 / 2, 0.0)
        ..rotateZ(2 * pi * (second / 60)),
      child: Container(
        height: 20,
        width: 2,
        color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.1),
      ),
    );
  }
}
