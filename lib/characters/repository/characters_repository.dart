import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pruebamarvel/characters/models/characters_response.dart';
import 'package:pruebamarvel/comics/models/comics_response.dart';
import 'package:pruebamarvel/core/api/api_helper.dart';
import 'package:pruebamarvel/core/api/api_services.dart';
import 'package:pruebamarvel/core/base_repository.dart';

abstract class CharactersRepository {
  Future<dynamic> getCharactersInformation(
      {required String path, required Map<String, String> queries});
}

class CharactersRepositoryImpl
    with BaseRespository
    implements CharactersRepository {
  CharactersResponse? _charactersResponse;
  ComicsResponse? _comicsResponse;

  CharactersResponse? get charactersResponse => _charactersResponse;
  ComicsResponse? get comicsResponse => _comicsResponse;

  @override
  Future<dynamic> getCharactersInformation(
      {required String path, required Map<String, String> queries}) async {
    return await ApiServices()
        .getRequest(path: path, queries: queries)
        .then((value) {
      if (value.statusCode == ApiHelper.success) {
        _charactersResponse =
            CharactersResponse.fromJson(jsonDecode(value.body));
      } else {
        throw const HttpException('Error');
      }
    }).onError((error, stackTrace) {
      debugPrint(stackTrace.toString());
    }).whenComplete(() => isLoading(false));
  }
}
