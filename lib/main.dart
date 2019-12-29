import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:spotifyclient/models/StateModel.dart';
import 'package:spotifyclient/pages/home.dart';

import './pages/entry.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (BuildContext context) => ApiTokenModel(),
        ),
        ChangeNotifierProvider(
          builder: (BuildContext context) => StateModel(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    ONLY IN DEBUGGING
    */
    // Provider.of<ApiTokenModel>(context, listen: false).deleteAccessToken();
    // Provider.of<ApiTokenModel>(context, listen: false).deleteExpiresAt();
    // Provider.of<ApiTokenModel>(context, listen: false).deleteExpiresIn();
    // Provider.of<ApiTokenModel>(context, listen: false).deleteScope();
    // Provider.of<ApiTokenModel>(context, listen: false).deleteRefreshToken();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
