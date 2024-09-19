import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:timer_app/pages/timer/timer_page.dart';

import '../../config/enums.dart';

mixin TimerMixin on State<TimerPage> {
  TimerState status = TimerState.initial;
  bool isBreakTime = true;
  Timer? timer;
  int tick = 0;
  int count = 0;

  void run() {
    setState(() {
      status = TimerState.inProgress;
    });
    isBreakTime = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        ++tick;
      });
    });
  }

  void pause() {
    setState(() {
      status = TimerState.pause;
    });
    timer?.cancel();
  }

  void stop() {
    setState(() {
      status = TimerState.initial;
      tick = 0;
    });
    isBreakTime = true;
    count == 4 ? count = 0 : count++;
    timer?.cancel();
  }

  String intToTime(int tick) {
    String second = "${tick % 60}".padLeft(2, "0");
    String minute = "${(tick % 3600) ~/ 60}".padLeft(2, "0");
    return "$minute:$second";
  }
}
