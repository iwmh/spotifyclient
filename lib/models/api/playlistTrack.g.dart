// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlistTrack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistTrack _$PlaylistTrackFromJson(Map<String, dynamic> json) {
  return PlaylistTrack(
      addedAt: json['addedAt'] as String,
      addedBy: json['addedBy'] == null
          ? null
          : User.fromJson(json['addedBy'] as Map<String, dynamic>),
      isLocal: json['isLocal'] as bool,
      track: json['track'] == null
          ? null
          : Track.fromJson(json['track'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlaylistTrackToJson(PlaylistTrack instance) =>
    <String, dynamic>{
      'addedAt': instance.addedAt,
      'addedBy': instance.addedBy,
      'isLocal': instance.isLocal,
      'track': instance.track
    };
