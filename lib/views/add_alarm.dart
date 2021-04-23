import 'package:alarm/util/config.dart';
import 'package:alarm/widgets/alarm_card.dart';
import 'package:alarm/widgets/clock.dart';
import 'package:alarm/widgets/gauge_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddAlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD ALARM', style: Config.h2(context)),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              theme.scaffoldBackgroundColor,
              theme.cardColor,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: Config.yMargin(context, 1)),
            Clock(isAlarm: true),
            SizedBox(height: Config.yMargin(context, 6)),
            GaugeSelector('HOUR', 23),
            SizedBox(height: Config.yMargin(context, 4)),
            GaugeSelector('MINUTE', 59),
            Spacer(),
            Opacity(
              opacity: 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'CANCEL',
                    style: Config.b1(context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SAVE',
                    style: Config.b1(context).copyWith(
                        color: theme.accentColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: Config.yMargin(context, 3)),
          ],
        ),
      ),
    );
  }
}
