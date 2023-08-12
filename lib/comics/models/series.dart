class Series {
  String? resourceUri;
  String? name;

  Series({this.resourceUri, this.name});

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json['resourceURI'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
      };
}
