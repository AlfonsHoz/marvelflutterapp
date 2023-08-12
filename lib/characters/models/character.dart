import 'comics.dart';
import 'events.dart';
import 'series.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'url.dart';

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  String? resourceUri;
  List<Url>? urls;
  Thumbnail? thumbnail;
  Comics? comics;
  Stories? stories;
  Events? events;
  Series? series;

  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceUri,
    this.urls,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.series,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        modified: json['modified'] as String?,
        resourceUri: json['resourceURI'] as String?,
        urls: (json['urls'] as List<dynamic>?)
            ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
            .toList(),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
        comics: json['comics'] == null
            ? null
            : Comics.fromJson(json['comics'] as Map<String, dynamic>),
        stories: json['stories'] == null
            ? null
            : Stories.fromJson(json['stories'] as Map<String, dynamic>),
        events: json['events'] == null
            ? null
            : Events.fromJson(json['events'] as Map<String, dynamic>),
        series: json['series'] == null
            ? null
            : Series.fromJson(json['series'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'resourceURI': resourceUri,
        'urls': urls?.map((e) => e.toJson()).toList(),
        'thumbnail': thumbnail?.toJson(),
        'comics': comics?.toJson(),
        'stories': stories?.toJson(),
        'events': events?.toJson(),
        'series': series?.toJson(),
      };
}
