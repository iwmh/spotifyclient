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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*
    ONLY IN DEBUGGING
    */
    Provider.of<ApiTokenModel>(context, listen: false).deleteAccessToken();
    Provider.of<ApiTokenModel>(context, listen: false).deleteExpiresAt();
    Provider.of<ApiTokenModel>(context, listen: false).deleteExpiresIn();
    Provider.of<ApiTokenModel>(context, listen: false).deleteScope();
    Provider.of<ApiTokenModel>(context, listen: false).deleteRefreshToken();

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
        '/': (BuildContext context) => HomePage(),
      },
    );
  }
}
