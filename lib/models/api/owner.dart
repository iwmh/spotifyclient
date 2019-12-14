import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/externalUrls.dart';
part 'owner.g.dart';

@JsonSerializable()

class Owner {
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  Owner({this.externalUrls, this.href, this.id, this.type, this.uri});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
