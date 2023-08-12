import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/colors.dart';

class TitleTextW extends StatelessWidget {
  const TitleTextW({super.key, required this.content, this.fontSize = 24});

  final String content;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: AppColors.appRed,
          fontFamily: 'Roboto-Bold'),
    );
  }
}
