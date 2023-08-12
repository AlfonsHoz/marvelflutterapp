class Image {
  String? path;
  String? extension;

  Image({this.path, this.extension});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        path: json['path'] as String?,
        extension: json['extension'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'path': path,
        'extension': extension,
      };
}
