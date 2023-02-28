import 'package:json_annotation/json_annotation.dart';

part 'update_user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest {
  String? nickname;
  @JsonKey(name: "push_notifications")
  String pushNotifications;
  @JsonKey(name: "interest_categories")
  List<String> interestCategories;

  UpdateUserRequest({
    this.nickname,
    required this.pushNotifications,
    required this.interestCategories,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
