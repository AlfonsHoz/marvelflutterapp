import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/models/character.dart';
import 'package:pruebamarvel/characters/repository/characters_repository.dart';

class CharactersViewModel extends ChangeNotifier {
  final CharactersRepositoryImpl _charactersRepository;

  CharactersViewModel(this._charactersRepository) {
    getCharacters();
  }

  bool get isLoading => _charactersRepository.loading;

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  void getCharacters() async {
    await _charactersRepository
        .getCharactersInformation(queries: {'limit': '90'}).then((value) {
      if (_charactersRepository.apiResponse != null) {
        _characters =
            _charactersRepository.apiResponse?.charactersResponse?.characters ??
                [];
      }
    });
    _charactersRepository.isLoading(true);
    notifyListeners();
  }
}
