import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:spotifyclient/util/util.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/api/Auth.dart';

class AcceptPage extends StatefulWidget {
  final String _initialUri;
  AcceptPage(this._initialUri);

  @override
  State<StatefulWidget> createState() {
    return _AcceptPageState();
  }
}

class _AcceptPageState extends State<AcceptPage> {
  WebViewController _controller;

  Future<void> _detectUriChange() async {
    var authCode;
    while (true) {
      var url = await _controller.currentUrl();
      if (url.contains('https://www.spotify.com/is/')) {
        var targetUrl = Uri.dataFromString(url);
        var code = targetUrl.queryParameters['code'];
        authCode = code;
        break;
      }
    }
    _requestForRefreshAndAccessToken(authCode);
  }

  void _requestForRefreshAndAccessToken(String authCode) async {
    var url = 'https://accounts.spotify.com/api/token';
    var body = {
      'grant_type': 'authorization_code',
      'code': authCode,
      'redirect_uri': 'https://www.spotify.com/is/'
    };

    var jsonData = await Util.readJson(context, './secrets.json');

    var clientId = jsonData['client_id'];
    var clientSecret = jsonData['client_secret'];

    var bytes = utf8.encode(clientId + ':' + clientSecret);
    var base64str = base64.encode(bytes);

    var headers = {HttpHeaders.authorizationHeader: 'Basic ' + base64str};

    var response = await http.post(url, body: body, headers: headers);

    //  convert response.body to JSON
    var resString = response.body;
    Map authMap = jsonDecode(resString);
    var auth = Auth.fromJson(authMap);

    // Store access token
    Provider.of<ApiTokenModel>(context, listen: false).storeAccessToken(auth.accessToken);

    // Get the access token
    var access_token = await Provider.of<ApiTokenModel>(context, listen: false).accessToken;

    // Moved to home page.
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spotify Authentication'),
      ),
      body: WebView(
          initialUrl: widget._initialUri,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) async {
            _controller = controller;
            await _detectUriChange();
          }),
    );
  }
}
