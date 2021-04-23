import 'package:alarm/util/config.dart';
import 'package:flutter/material.dart';

class GaugeSelector extends StatefulWidget {
  final String label;
  final int range;

  GaugeSelector(this.label, this.range);
  @override
  _GaugeSelectorState createState() => _GaugeSelectorState();
}

class _GaugeSelectorState extends State<GaugeSelector> {
  int _selectedIndex;
  PageController _pageController;

  _getOpacity(int index) {
    int val;
    if (index > _selectedIndex) {
      val = index - _selectedIndex;
    } else {
      val = _selectedIndex - index;
    }
    switch (val) {
      case 0:
        return 1.0;
        break;
      case 1:
        return 0.6;
        break;
      case 2:
        return 0.3;
        break;
      default:
        return 0.1;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.range ~/ 2;
    _pageController =
        PageController(initialPage: _selectedIndex, viewportFraction: 0.15);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          widget.label,
          style: Config.b1(context).copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Config.yMargin(context, 2)),
        Container(
          height: 25,
          padding: const EdgeInsets.only(left: 40),
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.range,
            onPageChanged: (newIndex) {
              setState(() {
                _selectedIndex = newIndex;
              });
            },
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOutSine),
              child: Opacity(
                opacity: _getOpacity(index),
                child: Text(
                  widget.range <= 24 ? '$index' : '${index + 1}',
                  style: Config.b1(context),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: Config.yMargin(context, 1)),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    theme.textTheme.bodyText1.color.withOpacity(0.02),
                    theme.textTheme.bodyText1.color.withOpacity(0.3),
                    theme.textTheme.bodyText1.color.withOpacity(0.02),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 10,
                width: 3,
                color: theme.accentColor,
                margin: const EdgeInsets.only(bottom: 5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
