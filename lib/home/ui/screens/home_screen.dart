import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/ui/widgets/category_card_widget.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/enums.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';
import 'package:pruebamarvel/core/widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Category> cardsCategories = [
    Category.characters,
    Category.comics,
    //Category.series,
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBarTitle: AppStrings.appTitleName,
      child: Container(
        color: AppColors.appBlack,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.count(
                crossAxisCount: 1,
                children: List.generate(
                    2,
                    (index) => InkWell(
                        onTap: () => Navigator.pushNamed(
                            context, cardsCategories[index].route),
                        child: CategoryCardW(
                          category: cardsCategories[index],
                        )),
                    growable: false)),
          ),
        ),
      ),
    );
  }
}
