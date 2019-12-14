import 'package:json_annotation/json_annotation.dart';
part 'image.g.dart';

@JsonSerializable()

class Image {
  int height;
  String url;
  int width;

  Image({this.height, this.url, this.width});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
  
}
