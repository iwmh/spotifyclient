import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:http/http.dart' as http;
import 'package:spotifyclient/models/api/artist.dart';
import 'package:spotifyclient/models/api/devices.dart';
import 'package:spotifyclient/models/api/pagingTracks.dart';
import 'package:spotifyclient/models/api/playlistTrack.dart';

final String urlDevice = 'https://api.spotify.com/v1/me/player/devices';
final String urlPlayback = 'https://api.spotify.com/v1/me/player';

class TrackCard extends StatelessWidget {
  final String id;
  final String name;
  final List<Artist> artists;

  TrackCard({this.id, this.name, this.artists});

  @override
  Widget build(BuildContext context) {
    var artistsString;
    artistsString = createArtistsNameString(artists);

    return GestureDetector(
      onTap: () async {
        // TODO: Hope this function is called whenever to use the API.
        await Provider.of<ApiTokenModel>(context, listen: false)
            .checkAccessTokenValidity();
        var body = {
          'uris': ['spotify:track:$id']
        };

        var authHeader =
            await Provider.of<ApiTokenModel>(context, listen: false)
                .getAuthorizationHeader();

        var responseDevice = await http.get(urlDevice, headers: authHeader);
        var resStringDevice = jsonDecode(responseDevice.body);
        var devices = Devices.fromJson(resStringDevice);

        var deviceId = devices.devices[0].id;
        final String url =
            'https://api.spotify.com/v1/me/player/play?device_id=$deviceId';

        var response =
            await http.put(url, body: jsonEncode(body), headers: authHeader);
        var resString = response.body;

        print("object");
      },
      onLongPress: () => {},
      child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(3.0),
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
                      // Track Name
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            name,
                            textAlign: TextAlign.left,
                            style: DefaultTextStyle.of(context)
                                .style
                                .apply(fontSizeFactor: 1.2),
                            overflow: TextOverflow.ellipsis,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            // Download Icon
                            Container(
                              child: Icon(Icons.file_download),
                            ),
                            // Artists
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 4.0),
                                child: Text(
                                  artistsString,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              // Menu Button
              Container(
                padding: EdgeInsets.all(3.0),
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Icon(Icons.more_vert),
              )
            ],
          )),
    );
  }
}

Future<List<PlaylistTrack>> getPlaylistTracks(
    BuildContext context, String id) async {
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

String createArtistsNameString(List<Artist> artists) {
  var retString = '';

  for (var i = 0; i < artists.length; i++) {
    retString = retString + artists[i].name;
    // if (i != 0 && artists.length != 1 && i != artists.length - 1) {
    if (artists.length > 1 && i != artists.length - 1) {
      retString = retString + ", ";
    }
  }
  return retString;
}
