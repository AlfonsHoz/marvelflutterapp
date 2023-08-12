import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:pruebamarvel/core/api/default_marvel_queries.dart';

class ApiServices {
  static final ApiServices _instance = ApiServices._internal();

  final String _baseUrl = 'gateway.marvel.com';

  final HttpWithMiddleware _client = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BASIC),
  ]);

  factory ApiServices() => _instance;

  ApiServices._internal();

  Future<http.Response> getRequest(
      {required String path, required Map<String, String> queries}) async {
    queries.addAll(DefaultMarvelQueries().toMap());
    return await _client.get(Uri.https(_baseUrl, path, queries));
  }
}
