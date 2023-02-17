import 'package:json_annotation/json_annotation.dart';

part 'living_guide_model.g.dart';

@JsonSerializable()
class LivingGuideModel {
  String? name;
  String? icon;
  String? url;

  LivingGuideModel({this.name, this.icon, this.url});

  factory LivingGuideModel.fromJson(Map<String, dynamic> json) =>
      _$LivingGuideModelFromJson(json);
}
