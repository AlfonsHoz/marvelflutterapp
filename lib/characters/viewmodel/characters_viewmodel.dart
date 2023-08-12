import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/models/character.dart';
import 'package:pruebamarvel/characters/repository/characters_repository.dart';
import 'package:pruebamarvel/core/app_routes.dart';
import 'package:pruebamarvel/core/services/navigation_services.dart';
import 'package:pruebamarvel/core/services/services_locator.dart';

class CharactersViewModel extends ChangeNotifier {
  final CharactersRepositoryImpl _charactersRepository;
  final NavigationServices navServices = locator<NavigationServices>();

  CharactersViewModel(this._charactersRepository) {
    _getCharacters();
  }

  bool get isLoading => _charactersRepository.loading;

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  Character? _characterSelected;

  Character? get characterSelected => _characterSelected;

  void _getCharacters() async {
    await _charactersRepository.getCharactersInformation(
        path: '/v1/public/characters',
        queries: {'limit': '100', 'orderBy': '-name'}).then((value) {
      if (_charactersRepository.apiResponse != null) {
        _characters =
            _charactersRepository.apiResponse?.charactersResponse?.characters ??
                [];
      }
    });
    _charactersRepository.isLoading(true);
    notifyListeners();
  }

  void _getCharacter(int characterId) async {
    await _charactersRepository.getCharactersInformation(
        path: '/v1/public/characters/$characterId',
        queries: {'limit': '100', 'orderBy': '-name'}).then((value) async {
      if (_charactersRepository.apiResponse != null) {
        _characterSelected = _charactersRepository
            .apiResponse?.charactersResponse?.characters?.first;
        await navServices.navigateTo(AppRoutes.characterDetailRoute);
      }
    });
    _charactersRepository.isLoading(true);
    notifyListeners();
  }

  void characterClicked(Character characterClicked) async {
    _characterSelected = characterClicked;
    _getCharacter(characterSelected!.id!);
  }
}
