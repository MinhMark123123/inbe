import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/model/other_app_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'other_app_response.g.dart';

@JsonSerializable()
class OtherAppResponse extends BaseListResponse<OtherAppModel> {
  OtherAppResponse({required super.data});

  factory OtherAppResponse.fromJson(Map<String, dynamic> json) =>
      _$OtherAppResponseFromJson(json);
}
