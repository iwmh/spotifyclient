import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';

import './pages/entry.dart';
import './pages/home.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (BuildContext context) => ApiTokenModel(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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
          case ConnectionState.done:
            if (snapshot.hasData) {
              return MaterialApp(
                title: 'You have an access token already!',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: Text('You have an access token.'),
              );
            } else {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: MyHomePage(title: 'Flutter Demo Home Page'),
              );
            }
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => EntryPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
