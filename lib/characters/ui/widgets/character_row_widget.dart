import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/models/character.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/extensions.dart';
import 'package:pruebamarvel/core/widgets/light_text_widget.dart';
import 'package:pruebamarvel/core/widgets/bold_text_widget.dart';

class CharacterRowW extends StatelessWidget {
  const CharacterRowW({super.key, required this.character});

  final Character character;

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
                  child: Hero(
                    tag: 'img1${character.id}',
                    child: Image.network(
                      character.thumbnail!.path!.marvelVerticalRectangleUrl(),
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(width: 100, height: 150),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BoldTextW(
                          content: character.name ?? '',
                          fontColor: AppColors.appWhite,
                        ),
                        LightTextW(content: character.description ?? '')
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
