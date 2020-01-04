import 'package:json_annotation/json_annotation.dart';
part 'externalIds.g.dart';

@JsonSerializable()

class ExternalIds {
  String isrc;

  ExternalIds({this.isrc});

  factory ExternalIds.fromJson(Map<String, dynamic> json) => _$ExternalIdsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);
}