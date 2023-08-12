import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/widgets/bold_text_widget.dart';
import 'package:pruebamarvel/core/widgets/normal_text_widget.dart';

class ComicItemRow extends StatelessWidget {
  const ComicItemRow({super.key, required this.name, this.role});

  final String name;
  final String? role;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          BoldTextW(content: name),
          const SizedBox(
            width: 15,
          ),
          NormalTextW(
            content: role ?? '',
            fontColor: AppColors.appWhite,
          )
        ],
      ),
    );
  }
}
