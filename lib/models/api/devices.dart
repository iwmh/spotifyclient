import 'package:json_annotation/json_annotation.dart';
import 'package:spotifyclient/models/api/device.dart';
part 'devices.g.dart';

@JsonSerializable()
class Devices {
  List<Device> devices;

  Devices({this.devices});

  factory Devices.fromJson(Map<String, dynamic> json) =>
      _$DevicesFromJson(json);

  Map<String, dynamic> toJson() => _$DevicesToJson(this);
}
