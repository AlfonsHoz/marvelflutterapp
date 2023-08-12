import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/models/character.dart';
import 'package:pruebamarvel/characters/repository/characters_repository.dart';
import 'package:pruebamarvel/comics/models/comic.dart';
import 'package:pruebamarvel/comics/repository/comics_repository.dart';
import 'package:pruebamarvel/core/app_routes.dart';
import 'package:pruebamarvel/core/services/navigation_services.dart';
import 'package:pruebamarvel/core/services/services_locator.dart';

class CharactersViewModel extends ChangeNotifier {
  final CharactersRepositoryImpl _charactersRepository;
  final ComicRepositoryImpl _comicsRepository;
  final NavigationServices navServices = locator<NavigationServices>();

  CharactersViewModel(this._charactersRepository, this._comicsRepository) {
    _getCharacters();
  }

  bool get isLoading => _charactersRepository.loading;

  bool _isSearchingCharacters = false;
  bool _isSearchingComics = false;

  List<Character> _characters = [];
  List<Character> _searchCharacters = [];
  List<Comic> _comics = [];

  List<Comic> _searchComics = [];

  List<Character> get characters =>
      _isSearchingCharacters ? _searchCharacters : _characters;
  List<Comic> get comics => _isSearchingComics ? _searchComics : _comics;

  Character? _characterSelected;

  Character? get characterSelected => _characterSelected;

  void _getCharacters() async {
    await _charactersRepository.getCharactersInformation(
        path: '/v1/public/characters',
        queries: {
          'limit': '100',
          'orderBy': '-name',
          'offset': '14'
        }).then((value) {
      if (_charactersRepository.charactersResponse != null) {
        _characters = _charactersRepository
                .charactersResponse?.charactersData?.characters ??
            [];
      }
    });
    _charactersRepository.isLoading(true);
    notifyListeners();
  }

  void _getCharacter(int characterId) async {
    _charactersRepository.isLoading(true);
    await _charactersRepository.getCharactersInformation(
        path: '/v1/public/characters/$characterId',
        queries: {}).then((value) async {
      if (_charactersRepository.charactersResponse != null) {
        _characterSelected = _charactersRepository
            .charactersResponse?.charactersData?.characters?.first;
        await navServices.navigateTo(AppRoutes.characterDetailRoute);
      }
    });
    notifyListeners();
  }

  void _getCharacterComics(int characterId) async {
    await _comicsRepository
        .getComics(path: '/v1/public/characters/$characterId/comics', queries: {
      'limit': '100',
    }).then((value) async {
      if (_comicsRepository.comicsResponse != null) {
        _comics = _comicsRepository.comicsResponse?.comicsData?.comics ?? [];
        await navServices.navigateTo(AppRoutes.characterComicsRoute);
      }
    });
    _comicsRepository.isLoading(true);
    notifyListeners();
  }

  void characterClicked(Character characterClicked) async {
    _characterSelected = characterClicked;
    _getCharacter(characterSelected!.id!);
  }

  void bottomNavItemClick(int currentIndex, int clickedIndex) {
    if (currentIndex != clickedIndex) {
      currentIndex == 1
          ? navServices.goBack()
          : _getCharacterComics(_characterSelected!.id!);
    }
  }

  searchCharacters(String search) {
    _searchCharacters = _characters
        .where((element) =>
            element.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    _isSearchingCharacters = true;
    notifyListeners();
  }

  searchCharacterComics(String search) {
    _searchComics = _comics
        .where((element) =>
            element.title!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    _isSearchingComics = true;
    notifyListeners();
  }
}
