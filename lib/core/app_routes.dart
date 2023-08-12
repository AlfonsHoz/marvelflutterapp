import 'package:pruebamarvel/characters/ui/screens/character_comics_screen.dart';
import 'package:pruebamarvel/characters/ui/screens/character_detail_screen.dart';
import 'package:pruebamarvel/characters/ui/screens/characters_screen.dart';
import 'package:pruebamarvel/comics/ui/screens/comic_detail_screen.dart';
import 'package:pruebamarvel/comics/ui/screens/comics_screen.dart';
import 'package:pruebamarvel/home/ui/screens/home_screen.dart';

class AppRoutes {
  static const homeRoute = '/home';

  static const charactersRoute = '/characters';
  static const characterDetailRoute = '/character-detail';
  static const characterComicsRoute = '/character-comics';

  static const comicsRoute = '/comics';
  static const comicDetailRoute = 'comic-detail';

  static routes() => {
        homeRoute: (_) => HomeScreen(),
        charactersRoute: (_) => const CharactersScreen(),
        characterDetailRoute: (_) => CharacterDetailScreen(),
        characterComicsRoute: (_) => CharacterComicsScreen(),
        comicsRoute: (_) => const ComicsScreen(),
        comicDetailRoute: (_) => const ComicDetailScreen(),
      };
}
