import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/model/faq_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faq_response.g.dart';

@JsonSerializable()
class FAQResponse extends BaseListResponse<FAQModel> {
  FAQResponse({required super.data});

  factory FAQResponse.fromJson(Map<String, dynamic> json) =>
      _$FAQResponseFromJson(json);
}
