import 'package:json_annotation/json_annotation.dart';
part 'device.g.dart';

@JsonSerializable()

class Device{
  String id;
  bool isActive;
  bool isPrivateSession;
  bool isRestricted;
  String name;
  String type;
  int volumePercent;

  Device(
      {this.id,
      this.isActive,
      this.isPrivateSession,
      this.isRestricted,
      this.name,
      this.type,
      this.volumePercent});

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
