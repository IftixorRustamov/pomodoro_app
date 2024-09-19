import 'package:flutter/material.dart';
import 'package:timer_app/config/texts.dart';
import 'package:timer_app/pages/timer/timer_page.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppTexts.appName,
      home: TimerPage(),
    );
  }
}
