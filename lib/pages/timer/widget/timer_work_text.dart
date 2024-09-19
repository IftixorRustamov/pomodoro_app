import 'package:flutter/cupertino.dart';

class TimerWorkText extends StatelessWidget {
  final String text;
  final Color color;

  const TimerWorkText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
