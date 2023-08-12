import 'package:get_it/get_it.dart';
import 'package:pruebamarvel/characters/repository/characters_repository.dart';
import 'package:pruebamarvel/core/services/navigation_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CharactersRepositoryImpl>(
      () => CharactersRepositoryImpl());
  locator.registerLazySingleton<NavigationServices>(() => NavigationServices());
}