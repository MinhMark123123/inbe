import 'package:inabe/src/data/dto/base_reponse.dart';
import 'package:inabe/src/data/dto/error_data.dart';
import 'package:inabe/src/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse<UserModel> {
  ErrorData? error;

  UserResponse({
    required super.data,
    this.error,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
