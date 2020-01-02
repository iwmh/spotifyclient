import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/StateModel.dart';
import 'package:spotifyclient/models/api/playlist.dart';
import 'package:spotifyclient/widgets/playlistcard.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Home Page.'),
      ),
      body: FutureBuilder<List<Playlist>>(
        future:
            Provider.of<StateModel>(context).getCurrentUsersPlaylists(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return _FutureList(list: snapshot.data);
              } else {
                return _FutureList(list: List<Playlist>());
              }
          }

          if (snapshot.hasData) {
            return _FutureList(list: snapshot.data);
          }
        },
      ),
    );
  }
}

class _FutureList extends StatelessWidget {
  final List<Playlist> list;

  _FutureList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return PlaylistCard(
          imageUrl: list[index].images[0].url,
          name: list[index].name,
        );
        // return Container(
        //   height: 30,
        //   child: Center(
        //     child: Text(list[index].name),
        //   ),
        // );
      },
    );
  }
}
