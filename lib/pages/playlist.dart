import 'package:flutter/material.dart';
import 'package:spotifyclient/models/arguments/PlaylistArgument.dart';

const String playlistTrackURL =
    'https://api.spotify.com/v1/playlists/{playlist_id}/tracks';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlaylistArgument args = ModalRoute.of(context).settings.arguments;
    var tracks = args.tracks;

    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            return Text(tracks[index].track.name);
          },
        ),
      ),
    ));
  }
}
