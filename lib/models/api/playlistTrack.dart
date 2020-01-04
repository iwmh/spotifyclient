import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/track.dart';
import 'package:spotifyclient/models/api/user.dart';

part 'playlistTrack.g.dart';

@JsonSerializable()

class PlaylistTrack {
  String addedAt;
  User addedBy;
  bool isLocal;
  Track track;

  PlaylistTrack(
      {this.addedAt,
      this.addedBy,
      this.isLocal,
      this.track});

  factory PlaylistTrack.fromJson(Map<String, dynamic> json) =>
      _$PlaylistTrackFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistTrackToJson(this);
}
