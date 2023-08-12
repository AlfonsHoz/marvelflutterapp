import 'package:pruebamarvel/characters/ui/screens/character_detail_screen.dart';
import 'package:pruebamarvel/characters/ui/screens/characters_screen.dart';
import 'package:pruebamarvel/home/ui/screens/home_screen.dart';

class AppRoutes {
  static const homeRoute = '/home';
  static const charactersRoute = '/characters';
  static const characterDetailRoute = '/character-detail';

  static routes() => {
        homeRoute: (context) => HomeScreen(),
        charactersRoute: (context) => const CharactersScreen(),
        characterDetailRoute: (context) => const CharacterDetailScreen(),
      };
}
