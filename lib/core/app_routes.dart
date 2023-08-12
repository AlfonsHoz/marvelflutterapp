import 'package:pruebamarvel/characters/ui/screens/characters_screen.dart';
import 'package:pruebamarvel/home/ui/screens/home_screen.dart';

class AppRoutes {
  static const homeRoute = '/home';
  static const charactersRoute = '/characters';

  static routes() => {
        homeRoute: (context) => const HomeScreen(),
        charactersRoute: (context) => const CharactersScreen(),
      };
}
