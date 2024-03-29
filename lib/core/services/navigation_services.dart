import 'package:flutter/material.dart';

class NavigationServices {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String route) async =>
      navKey.currentState!.pushNamed(route);

  Future<void> openDialog(String content) => showDialog(
      context: navKey.currentContext!,
      builder: (_) => AlertDialog(
            content: Text(content),
          ));

  void goBack() => navKey.currentState!.pop();
}
