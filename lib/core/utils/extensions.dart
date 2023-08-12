extension MarvelPhotoUrl on String {
  String marvelSquarePhotoUrl() => '$this/standard_medium.jpg';
  String marvelVerticalRectangleUrl() => '$this/portrait_medium.jpg';
  String marvelRectangularPhotoUrl() => '$this/landscape_xlarge.jpg';
  String marvelBiggerPhotoUrl() => '$this/portrait_uncanny.jpg';
}
