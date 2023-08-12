import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';

class TitleTextW extends StatelessWidget {
  const TitleTextW(
      {super.key,
      required this.content,
      this.fontSize = 24,
      this.fontColor = AppColors.appRed});

  final String content;
  final double fontSize;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: fontColor,
          fontFamily: 'Roboto-Bold'),
    );
  }
}
