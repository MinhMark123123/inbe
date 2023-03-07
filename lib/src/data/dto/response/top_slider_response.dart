import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/model/faq_model.dart';
import 'package:inabe/src/data/model/top_slider_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_slider_response.g.dart';

@JsonSerializable()
class TopSliderResponse extends BaseListResponse<TopSliderModel> {
  TopSliderResponse({required super.data});

  factory TopSliderResponse.fromJson(Map<String, dynamic> json) =>
      _$TopSliderResponseFromJson(json);
}
