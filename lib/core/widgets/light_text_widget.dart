import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';

class LightTextW extends StatelessWidget {
  const LightTextW(
      {super.key, required this.content, this.fontColor = AppColors.appWhite});

  final String content;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      content,
      style: TextStyle(
          fontSize: 16,
          color: fontColor,
          fontFamily: 'Roboto-Light',
          fontWeight: FontWeight.bold),
    );
  }
}
