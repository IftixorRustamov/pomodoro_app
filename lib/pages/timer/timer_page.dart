import 'package:flutter/material.dart';
import 'package:timer_app/config/colors.dart';
import 'package:timer_app/config/enums.dart';
import 'package:timer_app/config/texts.dart';
import 'package:timer_app/pages/timer/timer_mixin.dart';
import 'package:timer_app/pages/timer/widget/timer_widget.dart';
import 'package:timer_app/pages/timer/widget/timer_work_text.dart';
import 'package:timer_app/widgets/buttons/button.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TimerMixin {
  final longSize = const EdgeInsets.symmetric(horizontal: 74, vertical: 13);
  final shortSize = const EdgeInsets.symmetric(horizontal: 30, vertical: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isBreakTime ? AppColors.breakBackground : AppColors.workBackground,
      appBar: AppBar(
        backgroundColor:
            isBreakTime ? AppColors.breakBackground : AppColors.workBackground,
        centerTitle: true,
        title: const Text(
          AppTexts.appName,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          if (!isBreakTime && count == 4)
            const TimerWorkText(
                text: AppTexts.takeLongBreak, color: AppColors.white),
          if (isBreakTime && count != 4)
            const TimerWorkText(
                text: AppTexts.startToWork, color: AppColors.white),
          if (!isBreakTime && count != 4)
            const TimerWorkText(
                text: AppTexts.takeBreak, color: AppColors.white),
          TimerWidget(
            time: intToTime(tick),
            color: isBreakTime
                ? AppColors.breakButton
                : AppColors.workButton,
          ),
          SizedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (status == TimerState.initial)
                    Button(
                      title: AppTexts.startWORK,
                      onPressed: run,
                      padding: longSize,
                    ),
                  if (status == TimerState.inProgress)
                    Button(
                      title: AppTexts.pause,
                      onPressed: pause,
                      padding: longSize,
                    ),
                  if (status == TimerState.pause)
                    Row(
                      children: [
                        Button(
                            title: AppTexts.resume,
                            onPressed: run,
                            padding: shortSize),
                        const SizedBox(width: 15),
                        Button(
                          title: AppTexts.stop,
                          onPressed: stop,
                          padding: shortSize,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
