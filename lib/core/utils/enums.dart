import 'package:pruebamarvel/core/app_routes.dart';
import 'package:pruebamarvel/core/utils/app_strings.dart';

enum Category {
  characters(
      title: AppStrings.characters,
      photoUrl:
          'http://i.annihil.us/u/prod/marvel/i/mg/5/03/5274136b4372f/standard_fantastic.jpg',
      route: AppRoutes.charactersRoute),
  comics(
      title: AppStrings.comics,
      photoUrl:
          'http://i.annihil.us/u/prod/marvel/i/mg/6/90/51e0671a9e7b7/standard_fantastic.jpg',
      route: AppRoutes.comicsRoute);
  /*series(
      title: AppStrings.series,
      photoUrl:
          'https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/standard_fantastic.jpg',
      route: AppRoutes.charactersRoute);*/

  final String title;
  final String photoUrl;
  final String route;

  const Category(
      {required this.title, required this.photoUrl, required this.route});
}
