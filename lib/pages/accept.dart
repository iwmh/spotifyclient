import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
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
      if (url.startsWith('https://www.spotify.com/is/')) {
        var targetUrl = Uri.dataFromString(url);
        var code = targetUrl.queryParameters['code'];
        authCode = code;
        // Store the authorizationCode
        Provider.of<ApiTokenModel>(context, listen: false).storeAuthorizationCode(authCode);
        break;
      }
    }
    _requestForRefreshAndAccessToken(authCode);
  }

  void _requestForRefreshAndAccessToken(String authCode) async {

    await Provider.of<ApiTokenModel>(context, listen: false).getAccessToken(authCode);

    // Moved to home page.
    Navigator.pushReplacementNamed(context, '/');
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
