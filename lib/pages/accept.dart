import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

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

    var response = await http.post(url, body: body, headers: {});
    print('');
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
