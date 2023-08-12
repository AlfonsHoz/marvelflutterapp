import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/widgets/bold_text_widget.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.appBarTitle,
    this.bottomNavBar,
    this.onSearch,
    this.showSearch = false,
    required this.child,
  });

  final Widget child;
  final String appBarTitle;
  final Widget? bottomNavBar;
  final dynamic Function(String)? onSearch;
  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBarW = showSearch
        ? EasySearchBar(
            searchTextStyle: const TextStyle(color: AppColors.appWhite),
            searchBackIconTheme: const IconThemeData(color: AppColors.appWhite),
            searchClearIconTheme:
                const IconThemeData(color: AppColors.appWhite),
            searchBackgroundColor: AppColors.appBlack,
            searchCursorColor: AppColors.appWhite,
            elevation: 1,
            iconTheme: const IconThemeData(color: AppColors.appWhite),
            backgroundColor: AppColors.appBlack,
            title: BoldTextW(content: appBarTitle),
            onSearch: onSearch!,
          )
        : AppBar(
            title: BoldTextW(content: appBarTitle),
            elevation: 1,
            iconTheme: const IconThemeData(color: AppColors.appWhite),
            backgroundColor: AppColors.appBlack,
          ) as PreferredSizeWidget;
    return Scaffold(
        appBar: appBarW,
        bottomNavigationBar: bottomNavBar ?? const SizedBox(height: 0),
        body: child);
  }
}
