import 'package:spotifyclient/models/api/image.dart';
import 'package:json_annotation/json_annotation.dart';
import './externalUrls.dart';
import './owner.dart';
import './tracks.dart';

part 'playlist.g.dart';

@JsonSerializable()

class Playlist {
  bool collaborative;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  bool public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  Playlist(
      {this.collaborative,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.owner,
      this.public,
      this.snapshotId,
      this.tracks,
      this.type,
      this.uri});

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
