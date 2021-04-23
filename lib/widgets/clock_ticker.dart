import 'dart:math';

import 'package:flutter/material.dart';

class ClockTicker extends StatelessWidget {
  final int value;
  final double height;
  final bool isSecond;
  ClockTicker({this.value, this.height, this.isSecond = false});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(-2 / 2, -20 / 2, 0.0)
          ..rotateZ(2 * pi * (value / 60)),
        child: Container(
          height: height,
          width: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                isSecond ? theme.accentColor : theme.textTheme.bodyText1.color,
                Colors.transparent
              ],
              stops: [0.5, 0.55],
            ),
          ),
        ),
      ),
    );
  }
}
