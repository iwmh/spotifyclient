import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:spotifyclient/pages/auth.dart';
import 'package:spotifyclient/pages/home.dart';

class EntryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EntryPageState();
  }
}

class _EntryPageState extends State<EntryPage> {
  Future<String> _access_token;

  @override
  void initState() {
    setToken();
    super.initState();
  }

  void setToken() async {
    _access_token =
        Provider.of<ApiTokenModel>(context, listen: false).accessToken;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _access_token,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
        }
      },
    );
  }
}
