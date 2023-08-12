class Date {
  String? type;
  String? date;

  Date({this.type, this.date});

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json['type'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'date': date,
      };
}
