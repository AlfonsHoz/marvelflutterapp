import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/ui/widgets/character_bottom_nav.dart';
import 'package:pruebamarvel/characters/viewmodel/characters_viewmodel.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';
import 'package:pruebamarvel/core/utils/extensions.dart';
import 'package:pruebamarvel/core/widgets/multi_line_text_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  CharacterDetailScreen({super.key});
  late CharactersViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<CharactersViewModel>(context, listen: true);

    return BaseScreen(
        appBarTitle: viewModel.characterSelected?.name ?? '',
        bottomNavBar:
            CharacterBottomNav(selectedIndex: 0, onItemClicked: onItemClicked),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.appBlack,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: viewModel.characterSelected!.id.toString(),
                  child: Image.network(viewModel
                      .characterSelected!.thumbnail!.path!
                      .marvelBiggerPhotoUrl()),
                ),
                MultiLineTextW(
                  content: viewModel.characterSelected?.description ??
                      AppStrings.noDescription,
                  fontColor: AppColors.appWhite,
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ));
  }

  void onItemClicked(int index) {
    viewModel.bottomNavItemClick(0, index);
  }
}
