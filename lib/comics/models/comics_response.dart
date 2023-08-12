import 'comics.dart';

class ComicsResponse {
  Comics? comicsData;

  ComicsResponse({
    this.comicsData,
  });

  factory ComicsResponse.fromJson(Map<String, dynamic> json) {
    return ComicsResponse(
        comicsData: json['data'] == null
            ? null
            : Comics.fromJson(json['data'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() => {
        'data': comicsData?.toJson(),
      };
}
