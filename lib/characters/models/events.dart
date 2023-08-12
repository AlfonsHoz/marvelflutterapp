import 'item.dart';

class Events {
  int? available;
  int? returned;
  String? collectionUri;
  List<Item>? items;

  Events({this.available, this.returned, this.collectionUri, this.items});

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        available: json['available'] as int?,
        returned: json['returned'] as int?,
        collectionUri: json['collectionURI'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
