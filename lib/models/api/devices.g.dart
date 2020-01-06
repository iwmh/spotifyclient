// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Devices _$DevicesFromJson(Map<String, dynamic> json) {
  return Devices(
      devices: (json['devices'] as List)
          ?.map((e) =>
              e == null ? null : Device.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DevicesToJson(Devices instance) =>
    <String, dynamic>{'devices': instance.devices};
