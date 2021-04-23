import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool isActive;
  final Function(bool newValue) onChanged;

  CustomSwitch({@required this.isActive, @required this.onChanged});
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animation = Tween<double>(begin: 1.0, end: 4.6).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    widget.isActive
        ? _animationController.forward()
        : _animationController.reverse();
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.isActive),
      child: Stack(
        children: [
          Container(
            height: 22,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.5,
                color: widget.isActive
                    ? theme.accentColor
                    : theme.textTheme.bodyText1.color.withOpacity(0.1),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          // 4 to 24
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                top: 5,
                left: 5 * _animation.value,
                child: child,
              );
            },
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isActive
                    ? theme.accentColor
                    : theme.textTheme.bodyText1.color.withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
