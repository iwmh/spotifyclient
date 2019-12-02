import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './accept.dart';
import '../util/util.dart';

class EntryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EntryPageState();
  }
}

void _authorizeAccess(BuildContext context) async {
  var jsonData = await Util.readJson('./secrets.json');

  var queryParameters = {
    'client_id': jsonData['client_id'].toString(),
    'response_type': 'code',
    'scope': 'user-modify-playback-state user-library-modify playlist-read-private playlist-modify-public playlist-modify-private user-read-playback-state user-read-currently-playing',
    'redirect_uri': 'https://www.spotify.com/is/'
  };
  var uri = Uri.https('accounts.spotify.com', '/authorize', queryParameters)
      .toString();
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return AcceptPage(uri);
  }));
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entry Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Authorize Access'),
          onPressed: () async {
            _authorizeAccess(context);
          },
        ),
      ),
    );
  }
}
