import 'package:pruebamarvel/characters/models/characters.dart';

class CharactersResponse {
  Characters? charactersResponse;

  CharactersResponse({
    this.charactersResponse,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
        charactersResponse: json['data'] == null
            ? null
            : Characters.fromJson(json['data'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() => {
        'data': charactersResponse?.toJson(),
      };
}
