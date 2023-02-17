import 'package:inabe/src/data/dto/base_reponse.dart';
import 'package:inabe/src/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UseResponse extends BaseResponse<UserModel> {
  UseResponse({
    required super.data,
    super.message,
    super.code,
  });

  factory UseResponse.fromJson(Map<String, dynamic> json) => _$UseResponseFromJson(json);
}
