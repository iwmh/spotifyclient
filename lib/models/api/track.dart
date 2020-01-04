import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/album.dart';
import 'package:spotifyclient/models/api/artist.dart';
import 'package:spotifyclient/models/api/externalIds.dart';
import 'package:spotifyclient/models/api/externalUrls.dart';
part 'track.g.dart';

@JsonSerializable()

class Track {
  Album album;
  List<Artist> artists;
  List<String> availableMarkets;
  int discNumber;
  int durationMs;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  int popularity;
  String previewUrl;
  int trackNumber;
  String type;
  String uri;

  Track(
      {this.album,
      this.artists,
      this.availableMarkets,
      this.discNumber,
      this.durationMs,
      this.explicit,
      this.externalIds,
      this.externalUrls,
      this.href,
      this.id,
      this.name,
      this.popularity,
      this.previewUrl,
      this.trackNumber,
      this.type,
      this.uri});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}