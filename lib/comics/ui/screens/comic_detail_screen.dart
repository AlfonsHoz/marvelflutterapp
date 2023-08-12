import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/ui/widgets/character_row_widget.dart';
import 'package:pruebamarvel/comics/ui/widgets/comic_item_row.dart';
import 'package:pruebamarvel/comics/viewmodel/comics_viewmodel.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';
import 'package:pruebamarvel/core/utils/extensions.dart';
import 'package:pruebamarvel/core/widgets/bold_text_widget.dart';
import 'package:pruebamarvel/core/widgets/multi_line_text_widget.dart';

class ComicDetailScreen extends StatelessWidget {
  const ComicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ComicsViewModel viewModel =
        Provider.of<ComicsViewModel>(context, listen: true);

    return BaseScreen(
        appBarTitle: viewModel.selectedComic!.title ?? '',
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.appBlack,
            child: Column(
              children: [
                Image.network(viewModel.selectedComic?.thumbnail?.path
                        ?.marvelBiggerPhotoUrl() ??
                    ''),
                const BoldTextW(content: AppStrings.creators),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.selectedComic?.creators?.available,
                    itemBuilder: (_, index) => ComicItemRow(
                          name: viewModel.selectedComic?.creators?.items?[index]
                                  .name ??
                              '',
                          role: viewModel
                              .selectedComic?.creators?.items?[index].role,
                        )),
                const BoldTextW(content: AppStrings.characters),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.selectedComic?.characters?.available,
                    itemBuilder: (_, index) => ComicItemRow(
                          name: viewModel.selectedComic?.characters
                                  ?.items?[index].name ??
                              '',
                        )),
              ],
            ),
          ),
        ));
  }
}
