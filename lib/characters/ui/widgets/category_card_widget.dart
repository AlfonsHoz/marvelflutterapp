import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/enums.dart';
import 'package:pruebamarvel/core/widgets/bold_text_widget.dart';

class CategoryCardW extends StatelessWidget {
  const CategoryCardW({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkContrast,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            BoldTextW(
              content: category.title,
              fontSize: 22,
              fontColor: AppColors.appWhite,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(category.photoUrl),
              ),
            )
          ],
        ),
      ),
    );
  }
}
