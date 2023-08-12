import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pruebamarvel/comics/models/comics_response.dart';
import 'package:pruebamarvel/core/api/api_helper.dart';
import 'package:pruebamarvel/core/api/api_services.dart';
import 'package:pruebamarvel/core/base_repository.dart';

abstract class ComicsRepository {
  Future<dynamic> getComics(
      {required String path, required Map<String, String> queries});
}

class ComicRepositoryImpl with BaseRespository implements ComicsRepository {
  ComicsResponse? _comicsResponse;

  ComicsResponse? get comicsResponse => _comicsResponse;

  @override
  Future getComics(
      {required String path, required Map<String, String> queries}) async {
    return await ApiServices()
        .getRequest(path: path, queries: queries)
        .then((value) {
      if (value.statusCode == ApiHelper.success) {
        _comicsResponse = ComicsResponse.fromJson(jsonDecode(value.body));
      } else {
        throw const HttpException('Error');
      }
    }).onError((error, stackTrace) {
      debugPrint(stackTrace.toString());
    }).whenComplete(() => isLoading(false));
  }
}
