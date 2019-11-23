import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiTokenModel extends ChangeNotifier {
  // Secure Storage
  final _storage = new FlutterSecureStorage();

  // const
  final accessTokenKey = 'spotifyClient_access_token';
  final scopeKey = 'spotifyClient_scope';
  final expiresInKey = 'spotifyClient_expires_in';
  final refreshTokenKey = 'spotifyClient_refresh_token';

  // Store token-related information
  void storeAccessToken(String accessToken) async {
    await _storage.write(key: accessTokenKey, value: accessToken);
    notifyListeners();
  }

  void storeScope(String scope) async {
    await _storage.write(key: scopeKey, value: scope);
    notifyListeners();
  }

  void storeExpiresIn(String expiresIn) async {
    await _storage.write(key: expiresInKey, value: expiresIn);
    notifyListeners();
  }

  void storeRefreshToken(String refreshToken) async {
    await _storage.write(key: refreshTokenKey, value: refreshToken);
    notifyListeners();
  }

  // Read token-related information
  Future<String> get accessToken async {
    String ret = await _storage.read(key: accessTokenKey);
    return ret;
  }

  Future<String> get scope async {
    String ret = await _storage.read(key: scopeKey);
    return ret;
  }

  Future<String> get expiresIn async {
    String ret = await _storage.read(key: expiresInKey);
    return ret;
  }

  Future<String> get refreshToken async {
    String ret = await _storage.read(key: refreshTokenKey);
    return ret;
  }
}
