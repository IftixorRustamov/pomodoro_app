import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colors.dart';

class TimerWidget extends StatelessWidget {
  final String time;
  final Color color;


  const TimerWidget({super.key, required this.time, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(
        time,
        style: GoogleFonts.bebasNeue(
          letterSpacing: 10.0,
          color: AppColors.black,
          fontSize: 110,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
