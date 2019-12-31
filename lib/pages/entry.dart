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
  Future<bool> _isAuthorized;

  @override
  void initState() {
    setToken();
    super.initState();
  }

  void setToken() async {
    _isAuthorized =
        Provider.of<ApiTokenModel>(context, listen: false).hasAuthorizationCode();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isAuthorized,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              if (snapshot.data) {
                return HomePage();
                // Navigator.pushReplacementNamed(context, "/home");
              } else {
                return AuthPage();
              }
            } else {
              return AuthPage();
            }
        }
      },
    );
  }
}
