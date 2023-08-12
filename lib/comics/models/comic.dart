import 'characters.dart';
import 'creators.dart';
import 'date.dart';
import 'events.dart';
import 'image.dart';
import 'price.dart';
import 'series.dart';
import 'stories.dart';
import 'text_object.dart';
import 'thumbnail.dart';
import 'url.dart';

class Comic {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<TextObject>? textObjects;
  String? resourceUri;
  List<Url>? urls;
  Series? series;
  List<dynamic>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;
  List<Image>? images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Events? events;

  Comic({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        id: json['id'] as int?,
        digitalId: json['digitalId'] as int?,
        title: json['title'] as String?,
        issueNumber: json['issueNumber'] as int?,
        variantDescription: json['variantDescription'] as String?,
        description: json['description'] as String?,
        modified: json['modified'] as String?,
        isbn: json['isbn'] as String?,
        upc: json['upc'] as String?,
        diamondCode: json['diamondCode'] as String?,
        ean: json['ean'] as String?,
        issn: json['issn'] as String?,
        format: json['format'] as String?,
        pageCount: json['pageCount'] as int?,
        textObjects: (json['textObjects'] as List<dynamic>?)
            ?.map((e) => TextObject.fromJson(e as Map<String, dynamic>))
            .toList(),
        resourceUri: json['resourceURI'] as String?,
        urls: (json['urls'] as List<dynamic>?)
            ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
            .toList(),
        series: json['series'] == null
            ? null
            : Series.fromJson(json['series'] as Map<String, dynamic>),
        variants: json['variants'] as List<dynamic>?,
        collections: json['collections'] as List<dynamic>?,
        collectedIssues: json['collectedIssues'] as List<dynamic>?,
        dates: (json['dates'] as List<dynamic>?)
            ?.map((e) => Date.fromJson(e as Map<String, dynamic>))
            .toList(),
        prices: (json['prices'] as List<dynamic>?)
            ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
            .toList(),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        creators: json['creators'] == null
            ? null
            : Creators.fromJson(json['creators'] as Map<String, dynamic>),
        characters: json['characters'] == null
            ? null
            : Characters.fromJson(json['characters'] as Map<String, dynamic>),
        stories: json['stories'] == null
            ? null
            : Stories.fromJson(json['stories'] as Map<String, dynamic>),
        events: json['events'] == null
            ? null
            : Events.fromJson(json['events'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'digitalId': digitalId,
        'title': title,
        'issueNumber': issueNumber,
        'variantDescription': variantDescription,
        'description': description,
        'modified': modified,
        'isbn': isbn,
        'upc': upc,
        'diamondCode': diamondCode,
        'ean': ean,
        'issn': issn,
        'format': format,
        'pageCount': pageCount,
        'textObjects': textObjects?.map((e) => e.toJson()).toList(),
        'resourceURI': resourceUri,
        'urls': urls?.map((e) => e.toJson()).toList(),
        'series': series?.toJson(),
        'variants': variants,
        'collections': collections,
        'collectedIssues': collectedIssues,
        'dates': dates?.map((e) => e.toJson()).toList(),
        'prices': prices?.map((e) => e.toJson()).toList(),
        'thumbnail': thumbnail?.toJson(),
        'images': images?.map((e) => e.toJson()).toList(),
        'creators': creators?.toJson(),
        'characters': characters?.toJson(),
        'stories': stories?.toJson(),
        'events': events?.toJson(),
      };
}
