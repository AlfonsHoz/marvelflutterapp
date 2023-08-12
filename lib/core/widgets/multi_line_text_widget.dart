import 'package:flutter/material.dart';

class MultiLineTextW extends StatelessWidget {
  const MultiLineTextW(
      {super.key,
      required this.content,
      required this.fontColor,
      this.maxLines = 2});

  final String content;
  final Color fontColor;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        maxLines: maxLines,
        content,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: 18, color: fontColor, fontFamily: 'Roboto-Regular'),
      ),
    );
  }
}
