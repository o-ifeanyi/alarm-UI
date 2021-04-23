import 'package:alarm/util/config.dart';
import 'package:alarm/views/alarm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final _pages = [
    AlarmScreen(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    final _navItems = [
      CustomIcon(
        isActive: _selectedIndex == 0,
        iconData: Icons.alarm_outlined,
      ),
      CustomIcon(
        isActive: _selectedIndex == 1,
        iconData: Icons.share_outlined,
      ),
      CustomIcon(
        isActive: _selectedIndex == 2,
        iconData: MaterialCommunityIcons.web,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('ALARM', style: Config.h2(context)),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor:
            Theme.of(context).textTheme.bodyText1.color.withOpacity(0.4),
        onTap: (newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
        },
        // backgroundColor: Color(0xFFDFE6F0),
        backgroundColor: Theme.of(context).cardColor,
        items: _navItems.map((e) {
          return BottomNavigationBarItem(
            label: '',
            icon: e,
          );
        }).toList(),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({this.isActive, this.iconData});

  final bool isActive;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, size: 30),
        if (isActive) ...[
          SizedBox(height: 8),
          Container(
            height: 3,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ],
    );
  }
}
