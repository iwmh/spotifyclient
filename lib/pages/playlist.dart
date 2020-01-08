import 'package:flutter/material.dart';
import 'package:spotifyclient/models/arguments/PlaylistArgument.dart';
import 'package:spotifyclient/widgets/trackCard.dart';

const String playlistTrackURL =
    'https://api.spotify.com/v1/playlists/{playlist_id}/tracks';

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlaylistArgument args = ModalRoute.of(context).settings.arguments;
    var tracks = args.tracks;
    var name = args.name;

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            // return Text(tracks[index].track.name);
            return TrackCard(
              id: tracks[index].track.id,
              name: tracks[index].track.name,
              artists: tracks[index].track.artists,
            );
          },
        ),
      ),
    ));
  }
}
