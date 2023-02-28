import 'package:inabe/src/data/dto/base_reponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel extends BaseData {
  String? nickname;
  @JsonKey(name: "push_notifications")
  bool? pushNotifications;
  @JsonKey(name: "interest_categories")
  List<String>? interestCategories;

  UserModel({
    this.nickname,
    this.pushNotifications,
    this.interestCategories,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
