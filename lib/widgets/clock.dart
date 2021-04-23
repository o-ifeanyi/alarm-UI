import 'dart:math';
import 'dart:ui';

import 'package:alarm/provider/clock_provider.dart';
import 'package:alarm/provider/theme_provider.dart';
import 'package:alarm/util/config.dart';
import 'package:alarm/util/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'clock_marker.dart';
import 'clock_ticker.dart';
import 'inner_shadow.dart';

class Clock extends StatelessWidget {
  final bool isAlarm;

  Clock({this.isAlarm = false});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _clockShadow = [
      BoxShadow(
        color: theme.shadowColor,
        offset: Offset(5, 5),
        blurRadius: 10,
        spreadRadius: 1.0,
      ),
      BoxShadow(
        color: theme.backgroundColor,
        offset: Offset(-5, -5),
        blurRadius: 10,
        spreadRadius: 1.0,
      ),
    ];
    final _clockItemShadow = [
      BoxShadow(
        color: theme.shadowColor,
        offset: Offset(2, 2),
        blurRadius: 2,
        spreadRadius: 1.0,
      ),
      BoxShadow(
        color: theme.backgroundColor,
        offset: Offset(-2, -2),
        blurRadius: 2,
        spreadRadius: 1.0,
      ),
    ];
    return Consumer<ClockProvider>(
      builder: (context, provider, child) {
        return Container(
          height: Config.yMargin(context, 40),
          width: Config.yMargin(context, 40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.scaffoldBackgroundColor,
            boxShadow: _clockShadow,
          ),
          child: InnerShadow(
            shadows: _clockShadow,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.scaffoldBackgroundColor,
              ),
              padding: EdgeInsets.all(Config.yMargin(context, 3)),
              child: Stack(
                children: [
                  ...[
                    {'align': Alignment.topCenter, 'sec': 60},
                    {'align': Alignment.centerRight, 'sec': 15},
                    {'align': Alignment.bottomCenter, 'sec': 30},
                    {'align': Alignment.centerLeft, 'sec': 45},
                  ].map(
                    (e) => Align(
                      alignment: e['align'],
                      child: ClockMarker(
                        alignment: e['align'],
                        second: e['sec'],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: InnerShadow(
                      shadows: _clockItemShadow,
                      child: Consumer<ThemeProvider>(
                          builder: (context, provider, child) {
                        return GestureDetector(
                          onTap: () {
                            provider.themeData.brightness == Brightness.light
                                ? provider.themeData =
                                    themeOptions[ThemeOptions.Dark]
                                : provider.themeData =
                                    themeOptions[ThemeOptions.Light];
                            SharedPreferences.getInstance().then((pref) => {
                                  pref.setBool(
                                      'isDark',
                                      provider.themeData.brightness ==
                                          Brightness.dark)
                                });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(35),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.scaffoldBackgroundColor,
                            ),
                            child: provider.themeData.brightness ==
                                    Brightness.light
                                ? Icon(
                                    Icons.wb_sunny,
                                    size: 30,
                                    color: theme.accentColor,
                                  )
                                : Transform(
                                    transform: Matrix4.identity()
                                      ..translate(25 / 2, -14 / 2, 0.0)
                                      ..rotateZ(2 * pi * (5 / 60)),
                                    child: Icon(
                                      Ionicons.ios_moon,
                                      size: 30,
                                      color: theme.accentColor,
                                    ),
                                  ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InnerShadow(
                      shadows: _clockItemShadow,
                      child: Container(
                        margin: const EdgeInsets.all(35),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: theme.scaffoldBackgroundColor,
                        ),
                        child: Text('MON 9'),
                      ),
                    ),
                  ),
                  ClockTicker(
                    value: (provider.dateTime.hour - 12) * 5,
                    height: Config.yMargin(context, 22),
                  ),
                  ClockTicker(
                    value: provider.dateTime.minute,
                    height: Config.yMargin(context, 32),
                  ),
                  if (!isAlarm)
                    ClockTicker(
                      value: provider.dateTime.second,
                      height: Config.yMargin(context, 40),
                      isSecond: true,
                    ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 5,
                      width: 5,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.scaffoldBackgroundColor,
                        border: Border.all(color: theme.errorColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
