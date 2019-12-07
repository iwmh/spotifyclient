import 'dart:convert';

import 'package:flutter/services.dart';

class Util {
  static readJson(String assetPath) async {
    var jsonData = await rootBundle.loadString(assetPath);
    return json.decode(jsonData);
  }

  static Future<String> createBase64Str() async {
    var jsonData = await Util.readJson('./secrets.json');

    var clientId = jsonData['client_id'];
    var clientSecret = jsonData['client_secret'];

    var bytes = utf8.encode(clientId + ':' + clientSecret);
    return base64.encode(bytes);
  }
}
