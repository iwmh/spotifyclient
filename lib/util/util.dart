import 'dart:convert';

import 'package:flutter/services.dart';

class Util {
  static readJson(String assetPath) async {
    var jsonData = await rootBundle.loadString(assetPath);
    return json.decode(jsonData);
  }
}
