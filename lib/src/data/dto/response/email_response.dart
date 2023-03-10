import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/dto/response/meta_data_list.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_response.g.dart';

@JsonSerializable()
class EmailResponse extends BaseListResponse<EmailModel> {
  MetaDataList? meta;
  EmailResponse({required super.data, this.meta});

  factory EmailResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailResponseFromJson(json);
}

