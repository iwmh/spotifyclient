import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:spotifyclient/models/api/auth.dart';
import 'package:spotifyclient/util/util.dart';

class ApiTokenModel extends ChangeNotifier {
  // Secure Storage
  final _storage = new FlutterSecureStorage();

  /* 
   * Const
   */
  static const authorizationCodeKey = 'spotifyClient_authorization_code';

  static const accessTokenKey = 'spotifyClient_access_token';
  static const scopeKey = 'spotifyClient_scope';
  static const expiresInKey = 'spotifyClient_expires_in';
  static const expiresAtKey = 'spotifyClient_expires_at';
  static const refreshTokenKey = 'spotifyClient_refresh_token';

  /*
   * URLs
   */
  // Authorize access URL
  final authorizeAccessURL = 'https://accounts.spotify.com/authorize';

  // Access/Refresh token URL
  final accessTokenURL = 'https://accounts.spotify.com/api/token';

  // Get access token
  void getAccessToken(String authCode) async {
    var body = {
      'grant_type': 'authorization_code',
      'code': authCode,
      'redirect_uri': 'https://www.spotify.com/is/'
    };

    var base64str = await Util.createBase64Str();

    var headers = {HttpHeaders.authorizationHeader: 'Basic ' + base64str};

    var response =
        await http.post(accessTokenURL, body: body, headers: headers);

    //  convert response.body to JSON
    var resString = response.body;
    Map authMap = jsonDecode(resString);
    var auth = Auth.fromJson(authMap);

    // Store token-related information
    storeAccessToken(auth.accessToken);
    storeScope(auth.scope);
    storeExpiresIn(auth.expiresIn.toString());
    storeExpiresAt(auth.expiresIn.toString());
    storeRefreshToken(auth.refreshToken);
  }

  // Refreshing the access token by sending refresh token
  Future<void> refreshAccessToken() async {
    // get the refresh token from the storage
    var refreshToken = await _storage.read(key: refreshTokenKey);
    var body = {'grant_type': 'refresh_token', 'refresh_token': refreshToken};

    var base64str = await Util.createBase64Str();

    var headers = {HttpHeaders.authorizationHeader: 'Basic ' + base64str};

    var response =
        await http.post(accessTokenURL, body: body, headers: headers);

    //  convert response.body to JSON
    var resString = response.body;
    Map authMap = jsonDecode(resString);
    var auth = Auth.fromJson(authMap);

    // Store token-related information
    storeAccessToken(auth.accessToken);
    storeScope(auth.scope);
    storeExpiresIn(auth.expiresIn.toString());
    storeExpiresAt(auth.expiresIn.toString());
  }

  // See if the user has ever got the authorization Code before.
  Future<bool> hasAuthorizationCode() async {
    var authCode = await authorizationCode;
    if (authCode == null) {
      return false;
    } else {
      return authCode.length > 0;
    }
  }

  Future<bool> isAccessTokenAlive() async {
    // now
    var now = new DateTime.now();

    // expires_at
    var expiresAtMilisecStr = await expiresAt;
    if (expiresAtMilisecStr == null) return false;
    var expiresAtMilisec = int.parse(expiresAtMilisecStr);
    var expAt = new DateTime.fromMillisecondsSinceEpoch(expiresAtMilisec);

    return now.isBefore(expAt);
  }

  // if access token is unavalable, refresh the access token
  Future<void> checkAccessTokenValidity() async {
    if (!await isAccessTokenAlive()) {
      await refreshAccessToken();
    }
  }

  // Store authorizatioinCode
  void storeAuthorizationCode(String authorizationCode) async {
    await _storage.write(key: authorizationCodeKey, value: authorizationCode);
    notifyListeners();
  }

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

  // Convert "expires_in" miliseconds to "expires_at" date time.
  void storeExpiresAt(String expiresIn) async {
    var intExpiresIn = int.parse(expiresIn);

    var now = new DateTime.now();
    var expiresAt = now.add(new Duration(seconds: intExpiresIn));
    await _storage.write(
        key: expiresAtKey, value: expiresAt.millisecondsSinceEpoch.toString());
    notifyListeners();
  }

  void storeRefreshToken(String refreshToken) async {
    await _storage.write(key: refreshTokenKey, value: refreshToken);
    notifyListeners();
  }

  // Delete token-related information
  void deleteAccessToken() async {
    await _storage.delete(key: accessTokenKey);
    notifyListeners();
  }

  void deleteScope() async {
    await _storage.delete(key: scopeKey);
    notifyListeners();
  }

  void deleteExpiresIn() async {
    await _storage.delete(key: expiresInKey);
    notifyListeners();
  }

  void deleteExpiresAt() async {
    await _storage.delete(key: expiresAtKey);
    notifyListeners();
  }

  void deleteRefreshToken() async {
    await _storage.delete(key: refreshTokenKey);
    notifyListeners();
  }

  Future<String> get authorizationCode async {
    String ret = await _storage.read(key: authorizationCodeKey);
    return ret;
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

  Future<String> get expiresAt async {
    String ret = await _storage.read(key: expiresAtKey);
    return ret;
  }

  Future<String> get refreshToken async {
    String ret = await _storage.read(key: refreshTokenKey);
    return ret;
  }

  Future<Map<String, String>> getAuthorizationHeader() async {
    var accessToken = await this.accessToken;
    return {HttpHeaders.authorizationHeader: 'Bearer ' + accessToken};
  }
}
