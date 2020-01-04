import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:http/http.dart' as http;
import 'package:spotifyclient/models/api/pagingTracks.dart';
import 'package:spotifyclient/models/api/playlistTrack.dart';
import 'package:spotifyclient/models/api/track.dart';
import 'package:spotifyclient/models/arguments/PlaylistArgument.dart';
import 'package:spotifyclient/pages/playlist.dart';

class PlaylistCard extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;

  PlaylistCard({this.id, this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var playlistTracks = await getPlaylistTracks(context, id);
        var args = new PlaylistArgument(tracks: playlistTracks);
        Navigator.pushNamed(
          context, 
          '/playlist',
          arguments: args);
      },
      onLongPress: () => {},
      child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(3.0),
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image.network(imageUrl),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(name),
              )
            ],
          )),
    );
  }
}

Future<List<PlaylistTrack>> getPlaylistTracks(BuildContext context, String id) async {
  String _playlistTracksURL = 'https://api.spotify.com/v1/playlists/$id/tracks';

  var paging;
  List<PlaylistTrack> tracks = [];

  var authHeader = await Provider.of<ApiTokenModel>(context, listen: false)
      .getAuthorizationHeader();
  var response = await http.get(_playlistTracksURL, headers: authHeader);
  Map pagingMap = jsonDecode(response.body);
  paging = PagingTracks.fromJson(pagingMap);

  tracks = paging.items;

  return tracks;

}
