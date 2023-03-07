import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/model/faq_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_response.g.dart';

@JsonSerializable()
class EmailResponse extends BaseListResponse<EmailModel> {
  EmailResponse({required super.data});

  factory EmailResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailResponseFromJson(json);
}

@JsonSerializable()
class MetaData {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'next_page')
  int? nextPage;
  @JsonKey(name: 'prev_page')
  int? prevPage;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_count')
  int? totalCount;
  @JsonKey(name: 'limit_value')
  int? limitValue;

  MetaData({
    this.currentPage,
    this.nextPage,
    this.prevPage,
    this.totalCount,
    this.totalPages,
    this.limitValue,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}
