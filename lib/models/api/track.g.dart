// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List)
          ?.map((e) =>
              e == null ? null : Artist.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      availableMarkets:
          (json['availableMarkets'] as List)?.map((e) => e as String)?.toList(),
      discNumber: json['discNumber'] as int,
      durationMs: json['durationMs'] as int,
      explicit: json['explicit'] as bool,
      externalIds: json['externalIds'] == null
          ? null
          : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>),
      externalUrls: json['externalUrls'] == null
          ? null
          : ExternalUrls.fromJson(json['externalUrls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      popularity: json['popularity'] as int,
      previewUrl: json['previewUrl'] as String,
      trackNumber: json['trackNumber'] as int,
      type: json['type'] as String,
      uri: json['uri'] as String);
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'album': instance.album,
      'artists': instance.artists,
      'availableMarkets': instance.availableMarkets,
      'discNumber': instance.discNumber,
      'durationMs': instance.durationMs,
      'explicit': instance.explicit,
      'externalIds': instance.externalIds,
      'externalUrls': instance.externalUrls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'popularity': instance.popularity,
      'previewUrl': instance.previewUrl,
      'trackNumber': instance.trackNumber,
      'type': instance.type,
      'uri': instance.uri
    };
