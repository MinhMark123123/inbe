import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interest_response.g.dart';

@JsonSerializable()
class InterestResponse extends BaseListResponse<InterestModel> {
  InterestResponse({required super.data});

  factory InterestResponse.fromJson(Map<String, dynamic> json) =>
      _$InterestResponseFromJson(json);
}
