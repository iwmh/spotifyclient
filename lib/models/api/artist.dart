import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/externalUrls.dart';
part 'artist.g.dart';

@JsonSerializable()

class Artist {
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String type;
  String uri;

  Artist(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);

}