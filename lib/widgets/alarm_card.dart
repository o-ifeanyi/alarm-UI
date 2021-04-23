import 'package:alarm/util/config.dart';
import 'package:flutter/material.dart';

import 'custom_switch.dart';

class AlarmCard extends StatefulWidget {
  const AlarmCard({
    Key key,
  }) : super(key: key);

  @override
  _AlarmCardState createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: Config.xMargin(context, 35),
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSwitch(
            isActive: isActive,
            onChanged: (newValue) {
              print(newValue);
              setState(() {
                isActive = newValue;
              });
            },
          ),
          Spacer(),
          Text('8:20', style: Config.h1(context)),
          SizedBox(height: 10),
          Text(
            'MTWTFSS',
            style: Config.b1(context).copyWith(
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
