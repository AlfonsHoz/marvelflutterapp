import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/widgets/title_text_widget.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child, required this.appBarTitle});

  final Widget child;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            shadowColor: AppColors.appWhite,
            elevation: 1,
            iconTheme: const IconThemeData(color: AppColors.appWhite),
            backgroundColor: AppColors.appBlack,
            title: Center(child: TitleTextW(content: appBarTitle))),
        body: child);
  }
}
