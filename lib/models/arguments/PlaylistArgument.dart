import 'package:spotifyclient/models/api/playlistTrack.dart';

class PlaylistArgument {
  final String name;
  final List<PlaylistTrack> tracks;

  PlaylistArgument({this.name, this.tracks});
}