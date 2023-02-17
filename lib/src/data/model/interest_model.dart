import 'package:json_annotation/json_annotation.dart';

part 'interest_model.g.dart';

@JsonSerializable()
class InterestModel {
  String? name;
  int? id;

  InterestModel({this.name, this.id});

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);
}
