import 'package:json_annotation/json_annotation.dart';

part 'externalUrls.g.dart';

@JsonSerializable()

class ExternalUrls {
  String spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => _$ExternalUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalUrlsToJson(this);
  
}