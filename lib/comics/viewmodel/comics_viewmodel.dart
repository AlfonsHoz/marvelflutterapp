import 'package:flutter/material.dart';
import 'package:pruebamarvel/comics/models/comic.dart';
import 'package:pruebamarvel/comics/repository/comics_repository.dart';
import 'package:pruebamarvel/core/app_routes.dart';
import 'package:pruebamarvel/core/services/navigation_services.dart';
import 'package:pruebamarvel/core/services/services_locator.dart';

class ComicsViewModel extends ChangeNotifier {
  final ComicRepositoryImpl _comicsRepository;
  final NavigationServices navServices = locator<NavigationServices>();

  List<Comic> _comics = [];
  List<Comic> _searchComics = [];
  Comic? _selectedComic;

  bool _isSearchingComics = false;

  List<Comic> get comics => _isSearchingComics ? _searchComics : _comics;

  Comic? get selectedComic => _selectedComic;

  ComicsViewModel(this._comicsRepository) {
    _getComics();
  }

  void _getComics() async {
    _comicsRepository.isLoading(true);
    await _comicsRepository.getComics(
        path: '/v1/public/comics',
        queries: {'limit': '100', 'offset': '100'}).then((value) async {
      if (_comicsRepository.comicsResponse != null) {
        _comics = _comicsRepository.comicsResponse?.comicsData?.comics ?? [];
      }
      _comicsRepository.isLoading(false);
    });
    notifyListeners();
  }

  void _getComic(int comicId) async {
    _comicsRepository.isLoading(true);
    await _comicsRepository.getComics(
        path: '/v1/public/comics/$comicId', queries: {}).then((value) async {
      if (_comicsRepository.comicsResponse != null) {
        _selectedComic =
            _comicsRepository.comicsResponse?.comicsData?.comics?.first;
      }
      _comicsRepository.isLoading(false);
      navServices.navigateTo(AppRoutes.comicDetailRoute);
    });
    notifyListeners();
  }

  searchComics(String search) {
    _searchComics = _comics
        .where((element) =>
            element.title!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    _isSearchingComics = true;
    notifyListeners();
  }

  void comicClicked(Comic comicClicked) {
    _selectedComic = comicClicked;
    _getComic(comicClicked.id!);
  }
}
