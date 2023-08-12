import 'package:pruebamarvel/comics/models/comic.dart';

class Comics {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Comic>? comics;

  Comics({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.comics,
  });

  factory Comics.fromJson(Map<String, dynamic> json) {
    return Comics(
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
      total: json['total'] as int?,
      count: json['count'] as int?,
      comics: (json['results'] as List<dynamic>?)
          ?.map((e) => Comic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': comics?.map((e) => e.toJson()).toList(),
      };
}
