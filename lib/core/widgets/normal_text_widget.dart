import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/colors.dart';

class NormalTextW extends StatelessWidget {
  const NormalTextW(
      {super.key, required this.content, this.fontColor = AppColors.appWhite});

  final String content;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: fontColor,
          fontFamily: 'Roboto-Bold'),
    );
  }
}
