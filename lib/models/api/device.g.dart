// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
      id: json['id'] as String,
      isActive: json['isActive'] as bool,
      isPrivateSession: json['isPrivateSession'] as bool,
      isRestricted: json['isRestricted'] as bool,
      name: json['name'] as String,
      type: json['type'] as String,
      volumePercent: json['volumePercent'] as int);
}

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'isPrivateSession': instance.isPrivateSession,
      'isRestricted': instance.isRestricted,
      'name': instance.name,
      'type': instance.type,
      'volumePercent': instance.volumePercent
    };
