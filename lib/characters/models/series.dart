import 'item.dart';

class Series {
  int? available;
  int? returned;
  String? collectionUri;
  List<Item>? items;

  Series({this.available, this.returned, this.collectionUri, this.items});

  factory Series.fromJson(Map<String, dynamic> json) => Series(
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
