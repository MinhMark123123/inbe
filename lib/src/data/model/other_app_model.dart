import 'package:json_annotation/json_annotation.dart';

part 'other_app_model.g.dart';

@JsonSerializable()
class OtherAppModel {
  String? name;
  String? icon;
  String? content;
  @JsonKey(name: 'ios_app')
  String? iosApp;
  @JsonKey(name: 'android_app')
  String? androidApp;

  OtherAppModel({
    this.name,
    this.icon,
    this.content,
    this.iosApp,
    this.androidApp,
  });

  factory OtherAppModel.fromJson(Map<String, dynamic> json) =>
      _$OtherAppModelFromJson(json);
}
