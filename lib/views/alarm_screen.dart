import 'package:alarm/util/config.dart';
import 'package:alarm/views/add_alarm.dart';
import 'package:alarm/widgets/alarm_card.dart';
import 'package:alarm/widgets/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.scaffoldBackgroundColor,
            theme.cardColor,
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Config.yMargin(context, 1)),
          Clock(),
          SizedBox(height: Config.yMargin(context, 6)),
          Container(
            height: Config.yMargin(context, 30),
            padding: const EdgeInsets.fromLTRB(25, 15, 0, 15),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddAlarmScreen(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: Config.xMargin(context, 35),
                      decoration: BoxDecoration(
                          color: theme.accentColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.add, size: 40, color: Colors.white),
                          Spacer(),
                          Text(
                            'ADD',
                            style: Config.h1(context)
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            'NEW',
                            style: Config.h1(context)
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return AlarmCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
