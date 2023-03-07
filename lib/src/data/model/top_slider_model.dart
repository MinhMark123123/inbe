import 'package:json_annotation/json_annotation.dart';

part 'top_slider_model.g.dart';

@JsonSerializable()
class TopSliderModel {
  String? href;
  String? src;
  String? alt;

  TopSliderModel({
    this.href,
    this.src,
    this.alt,
  });

  factory TopSliderModel.fromJson(Map<String, dynamic> json) =>
      _$TopSliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopSliderModelToJson(this);

  static List<TopSliderModel> fromJsonList(List json) {
    return json.map((e) => TopSliderModel.fromJson(e)).toList();
  }
}
