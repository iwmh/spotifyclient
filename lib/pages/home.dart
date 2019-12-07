import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                  title: Text('This is Home Page'),
                ),
                body: Center(
                  child: RaisedButton(
                    child: Text('Back'),
                    onPressed: () {
                      Provider.of<ApiTokenModel>(context, listen: false)
                          .checkAccessTokenValidity();
                    },
                  ),
                ),
              );
  }

}