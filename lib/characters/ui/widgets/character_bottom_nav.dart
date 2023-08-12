import 'package:flutter/material.dart';
import 'package:pruebamarvel/core/utils/app_colors.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';

class CharacterBottomNav extends StatelessWidget {
  const CharacterBottomNav(
      {super.key, required this.selectedIndex, required this.onItemClicked});

  final int selectedIndex;
  final void Function(int)? onItemClicked;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemClicked,
        elevation: 1,
        unselectedItemColor: AppColors.appWhite,
        selectedItemColor: AppColors.appRed,
        backgroundColor: AppColors.appBlack,
        items: const [
          BottomNavigationBarItem(
              label: AppStrings.character,
              icon: Icon(
                Icons.person,
              )),
          BottomNavigationBarItem(
              label: AppStrings.comics, icon: Icon(Icons.book)),
        ]);
  }
}
