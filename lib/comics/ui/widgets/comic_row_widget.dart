import 'package:flutter/material.dart';
import 'package:pruebamarvel/comics/models/comic.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/extensions.dart';
import 'package:pruebamarvel/core/widgets/bold_text_widget.dart';
import 'package:pruebamarvel/core/widgets/light_text_widget.dart';
import 'package:pruebamarvel/core/widgets/normal_text_widget.dart';

class ComicRowW extends StatelessWidget {
  const ComicRowW({super.key, required this.comic});

  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkContrast,
      child: Container(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    comic.thumbnail!.path!.marvelVerticalRectangleUrl(),
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(width: 100, height: 150),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        NormalTextW(
                          content: comic.title ?? '',
                          fontColor: AppColors.appWhite,
                        ),
                        LightTextW(content: comic.description ?? ''),
                        BoldTextW(
                            content: comic.prices?.first.price.toString() ?? '')
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
