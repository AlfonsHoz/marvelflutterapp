import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/viewmodel/characters_viewmodel.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';
import 'package:pruebamarvel/core/utils/extensions.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CharactersViewModel viewModel =
        Provider.of<CharactersViewModel>(context, listen: true);

    return BaseScreen(
        appBarTitle: viewModel.characterSelected?.name ?? '',
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.appBlack,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'img1${viewModel.characterSelected?.id}',
                  child: Image.network(viewModel
                      .characterSelected!.thumbnail!.path!
                      .marvelBiggerPhotoUrl()),
                ),
              ],
            ),
          ),
        ));
  }
}
