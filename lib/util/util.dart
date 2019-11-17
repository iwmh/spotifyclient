import 'dart:convert';

import 'package:flutter/material.dart';

class Util {
  static readJson(BuildContext context, String assetPath) async {
    var jsonData =
        await DefaultAssetBundle.of(context).loadString('./secrets.json');
    return json.decode(jsonData);
  }
}
