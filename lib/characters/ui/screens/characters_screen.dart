import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/ui/widgets/character_row_widget.dart';
import 'package:pruebamarvel/characters/viewmodel/characters_viewmodel.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharactersViewModel viewModel =
        Provider.of<CharactersViewModel>(context, listen: true);

    return BaseScreen(
        appBarTitle: AppStrings.characters,
        child: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: AppColors.appBlack,
                child: ListView.builder(
                    itemBuilder: (_, index) => GestureDetector(
                          child: CharacterRowW(
                              character: viewModel.characters[index]),
                          onTap: () {
                            viewModel
                                .characterClicked(viewModel.characters[index]);
                          },
                        ),
                    itemCount: viewModel.characters.length),
              ));
  }
}
