import 'package:json_annotation/json_annotation.dart';

part 'data_push_model.g.dart';

@JsonSerializable()
class DataPushModel {
  String? id;
  String? href;

  DataPushModel({
    this.id,
    this.href,
  });

  factory DataPushModel.fromJson(Map<String, dynamic> json) =>
      _$DataPushModelFromJson(json);
}
