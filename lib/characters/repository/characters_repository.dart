import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/models/characters_response.dart';
import 'package:pruebamarvel/core/api/api_helper.dart';
import 'package:pruebamarvel/core/api/api_services.dart';

abstract class CharactersRepository {
  Future<dynamic> getCharactersInformation();
}

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersResponse? _defaultApiResponse;

  bool _loading = false;

  bool get loading => _loading;

  CharactersResponse? get apiResponse => _defaultApiResponse;

  @override
  Future<dynamic> getCharactersInformation(
      {String path = '', Map<String, String> queries = const {}}) async {
    return await ApiServices()
        .getRequest(path: path, queries: queries)
        .then((value) {
      if (value.statusCode == ApiHelper.success) {
        _defaultApiResponse =
            CharactersResponse.fromJson(jsonDecode(value.body));
      } else {
        throw const HttpException('Error');
      }
    }).onError((error, stackTrace) {
      debugPrint(stackTrace.toString());
    }).whenComplete(() => isLoading(false));
  }

  void isLoading(bool isLoading) => _loading = !_loading;
}
