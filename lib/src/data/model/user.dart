import 'package:inabe/src/data/dto/base_reponse.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel extends BaseData {
  String? name;
  UserModel({this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}