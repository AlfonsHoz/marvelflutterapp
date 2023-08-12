import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/ui/widgets/character_bottom_nav.dart';
import 'package:pruebamarvel/characters/viewmodel/characters_viewmodel.dart';
import 'package:pruebamarvel/comics/ui/widgets/comic_row_widget.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';

class CharacterComicsScreen extends StatelessWidget {
  CharacterComicsScreen({super.key});
  late CharactersViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<CharactersViewModel>(context, listen: true);

    return BaseScreen(
        showSearch: true,
        appBarTitle: '${viewModel.characterSelected?.name} Comics',
        bottomNavBar:
            CharacterBottomNav(selectedIndex: 1, onItemClicked: onItemClicked),
        onSearch: viewModel.searchCharacterComics,
        child: Container(
          color: AppColors.appBlack,
          child: ListView.builder(
              itemCount: viewModel.comics.length,
              itemBuilder: (context, index) =>
                  ComicRowW(comic: viewModel.comics[index])),
        ));
  }

  void onItemClicked(int index) {
    viewModel.bottomNavItemClick(1, index);
  }
}
