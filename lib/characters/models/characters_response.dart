import 'package:pruebamarvel/characters/models/characters.dart';

class CharactersResponse {
  Characters? charactersData;

  CharactersResponse({
    this.charactersData,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
        charactersData: json['data'] == null
            ? null
            : Characters.fromJson(json['data'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() => {
        'data': charactersData?.toJson(),
      };
}
