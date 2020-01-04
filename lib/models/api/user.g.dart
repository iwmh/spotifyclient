// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      externalUrls: json['externalUrls'] == null
          ? null
          : ExternalUrls.fromJson(json['externalUrls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'type': instance.type,
      'uri': instance.uri
    };
