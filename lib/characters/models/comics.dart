import 'item.dart';

class Comics {
  int? available;
  int? returned;
  String? collectionUri;
  List<Item>? items;

  Comics({this.available, this.returned, this.collectionUri, this.items});

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
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
