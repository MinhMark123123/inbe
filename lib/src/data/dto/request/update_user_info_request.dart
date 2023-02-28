import 'package:json_annotation/json_annotation.dart';

part 'update_user_info_request.g.dart';

@JsonSerializable()
class UpdateUserInfoRequest {
  String email;
  String password;
  String? otp;

  UpdateUserInfoRequest({
    required this.email,
    required this.password,
    this.otp,
  });

  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserInfoRequestToJson(this);
}
