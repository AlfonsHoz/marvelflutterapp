import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/app_routes.dart';
import 'package:pruebamarvel/core/utils/colors.dart';
import 'package:pruebamarvel/core/utils/strings.dart';
import 'package:pruebamarvel/core/widgets/normal_text_widget.dart';
import 'package:pruebamarvel/core/widgets/title_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: AppColors.appWhite,
          elevation: 1,
          backgroundColor: AppColors.appBlack,
          title: const Center(
              child: TitleTextW(content: AppStrings.appTitleName))),
      body: Container(
        color: AppColors.appBlack,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.charactersRoute),
              child: Card(
                color: AppColors.appWhite,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: const Column(
                    children: [
                      TitleTextW(content: AppStrings.characters, fontSize: 22),
                      NormalTextW(
                        fontColor: AppColors.darkText,
                        content: AppStrings.characters,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
