import 'dart:io';

class ApiResult<T> {
  final T? data;
  final int statusCode;
  final String? errorMessage;
  ApiResult({this.data, this.errorMessage, required this.statusCode});

  void throwApiException() {
    throw HttpException(errorMessage.toString());
  }
}
