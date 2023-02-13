import 'package:inabe/src/data/dto/base_reponse.dart';
import 'package:inabe/src/data/model/user.dart';

class UseResponse extends BaseResponse<UserModel> {
  UseResponse({
    required super.data,
    required super.message,
    required super.code,
  });
}
