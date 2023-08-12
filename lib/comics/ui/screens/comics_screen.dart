import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/comics/ui/widgets/comic_row_widget.dart';
import 'package:pruebamarvel/comics/viewmodel/comics_viewmodel.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';

class ComicsScreen extends StatelessWidget {
  const ComicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ComicsViewModel viewModel =
        Provider.of<ComicsViewModel>(context, listen: true);
    return BaseScreen(
        showSearch: true,
        appBarTitle: AppStrings.comics,
        onSearch: viewModel.searchComics,
        child: Container(
            color: AppColors.appBlack,
            child: ListView.builder(
              itemCount: viewModel.comics.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    viewModel.comicClicked(viewModel.comics[index]);
                  },
                  child: ComicRowW(comic: viewModel.comics[index])),
            )));
  }
}
