import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/artist.dart';
import 'package:spotifyclient/models/api/externalUrls.dart';
import 'package:spotifyclient/models/api/image.dart';
part 'album.g.dart';

@JsonSerializable()

class Album {
  String albumType;
  List<Artist> artist;
  List<String> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  String type;
  String uri;

  Album(
      {this.albumType,
      this.artist,
      this.availableMarkets,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.type,
      this.uri});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

}