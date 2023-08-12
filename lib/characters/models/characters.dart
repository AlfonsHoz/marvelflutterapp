import 'character.dart';

class Characters {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Character>? characters;

  Characters({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.characters,
  });

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      count: json['count'] as int?,
      characters: (json['results'] as List<dynamic>?)
          ?.map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': characters?.map((e) => e.toJson()).toList(),
      };
}
