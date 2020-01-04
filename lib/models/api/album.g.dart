// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
      albumType: json['albumType'] as String,
      artist: (json['artist'] as List)
          ?.map((e) =>
              e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      availableMarkets:
          (json['availableMarkets'] as List)?.map((e) => e as String)?.toList(),
      externalUrls: json['externalUrls'] == null
          ? null
          : ExternalUrls.fromJson(json['externalUrls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List)
          ?.map((e) =>
              e == null ? null : Image.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      name: json['name'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String);
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'albumType': instance.albumType,
      'artist': instance.artist,
      'availableMarkets': instance.availableMarkets,
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri
    };
