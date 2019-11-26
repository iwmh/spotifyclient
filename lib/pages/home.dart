import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:spotifyclient/pages/entry.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
              return Scaffold(
                appBar: AppBar(
                  title: Text('Home Page'),
                ),
                body: Center(
                  child: RaisedButton(
                    child: Text('Back'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            } else {
              return EntryPage();
            }
        }
      },
    );
  }
}
