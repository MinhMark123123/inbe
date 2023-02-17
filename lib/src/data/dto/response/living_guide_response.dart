import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'living_guide_response.g.dart';

@JsonSerializable()
class LivingGuideResponse extends BaseListResponse {
  LivingGuideResponse({required super.data});

  factory LivingGuideResponse.fromJson(Map<String, dynamic> json) =>
      _$LivingGuideResponseFromJson(json);
}
