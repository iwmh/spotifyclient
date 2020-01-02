import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyclient/models/ApiTokenModel.dart';
import 'package:spotifyclient/models/api/pagingPlaylist.dart';
import 'package:spotifyclient/models/api/playlist.dart';
import 'package:http/http.dart' as http;

class StateModel extends ChangeNotifier {
  /*
   * URLs
   */

  static const getPlaylistUrl = 'https://api.spotify.com/v1/me/playlists';

  // List of playlist
  List<Playlist> playlist = [];

  Future<List<Playlist>> getCurrentUsersPlaylists(BuildContext context) async {
    var paging;

    if (notHavePlaylist()) {
      var authHeader = await Provider.of<ApiTokenModel>(context, listen: false)
          .getAuthorizationHeader();
      var response = await http.get(getPlaylistUrl, headers: authHeader);

      Map pagingMap = jsonDecode(response.body);
      paging = PagingPlaylist.fromJson(pagingMap);

      playlist = paging.items;
      return paging.items;
    } else {
      return playlist;
    }
  }

  List<Playlist> get playlists {
    return playlist;
  }

  bool notHavePlaylist() {
    return playlist.length == 0;
  }
}
