import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  String email;
  String nickname;
  String password;
  @JsonKey(name: "push_notifications")
  String pushNotifications;
  @JsonKey(name: "interest_categories")
  List<String> interestCategories;
  @JsonKey(name: "fcm_devise_token")
  String fcmDeviseToken;

  UserRequest({
    required this.email,
    required this.nickname,
    required this.password,
    required this.pushNotifications,
    required this.interestCategories,
    required this.fcmDeviseToken,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}

// {
//   "email": "gordon@greenholt.co.uk",
//   "nickname": "樋口正男",
//   "password": "12345678",
//   "push_notifications": "true",
//   "interest_categories": [
//     "1",
//     "3"
//   ]
// }
