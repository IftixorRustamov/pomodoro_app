import 'package:flutter/material.dart';

import '../../config/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  const Button(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.white,
      padding: padding,
      child: Text(
        title,
        style: TextStyle(color: AppColors.workBackground, fontSize: 32),
      ),
    );
  }
}
