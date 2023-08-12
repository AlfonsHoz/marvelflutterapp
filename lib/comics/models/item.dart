class Item {
  String? resourceUri;
  String? name;
  String? role;

  Item({this.resourceUri, this.name, this.role});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        resourceUri: json['resourceURI'] as String?,
        name: json['name'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
        'role': role,
      };
}
