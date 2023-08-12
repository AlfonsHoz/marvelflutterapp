class TextObject {
  String? type;
  String? language;
  String? text;

  TextObject({this.type, this.language, this.text});

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json['type'] as String?,
        language: json['language'] as String?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'language': language,
        'text': text,
      };
}
