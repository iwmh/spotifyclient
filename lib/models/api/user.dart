import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/externalUrls.dart';
part 'user.g.dart';

@JsonSerializable()

class User{
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  User({this.externalUrls, this.href, this.id, this.type, this.uri});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}