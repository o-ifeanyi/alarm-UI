import 'dart:async';

import 'package:flutter/cupertino.dart';

class ClockProvider extends ChangeNotifier {
  ClockProvider() {
    _dateTime = DateTime.now();
    _startTimer();
  }

  DateTime _dateTime;
  DateTime get dateTime => _dateTime;

  Timer _timer;
  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
