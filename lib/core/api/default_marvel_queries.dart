import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultMarvelQueries {
  String ts = '';
  String apikey = '';
  String hash = '';

  DefaultMarvelQueries() {
    ts = DateTime.now().millisecondsSinceEpoch.toString();
    apikey = '24468d848a06bf7297f4e066cc771b92';
    hash = _generateHash();
  }

  Map<String, String> toMap() => {'ts': ts, 'apikey': apikey, 'hash': hash};

  String _generateHash() {
    String input = '$ts${dotenv.env['MARVEL_API_KEY']}$apikey';
    return md5.convert(utf8.encode(input)).toString();
  }
}
