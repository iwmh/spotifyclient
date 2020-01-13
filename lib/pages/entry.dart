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
  Future<bool> _requiresUserToAuthenticate;

  @override
  void initState() {
    setToken();
    super.initState();
  }

  void setToken() async {
    /*
    ONLY IN DEBUGGING
    */
    // await Provider.of<ApiTokenModel>(context, listen: false).deleteAuthorizationCode();
    // await Provider.of<ApiTokenModel>(context, listen: false).deleteAccessToken();
    // await Provider.of<ApiTokenModel>(context, listen: false).deleteExpiresAt();
    // await Provider.of<ApiTokenModel>(context, listen: false).deleteExpiresIn();
    // await Provider.of<ApiTokenModel>(context, listen: false).deleteScope();
    // await Provider.of<ApiTokenModel>(context, listen: false).deleteRefreshToken();

    _requiresUserToAuthenticate =
        Provider.of<ApiTokenModel>(context, listen: false)
            .requiresUserToAuthenticate();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _requiresUserToAuthenticate,
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
