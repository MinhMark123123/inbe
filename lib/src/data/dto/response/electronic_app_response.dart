import 'package:inabe/src/data/dto/base_list_reponse.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'electronic_app_response.g.dart';

@JsonSerializable()
class ElectronicAppResponse extends BaseListResponse<ElectronicAppModel> {
  ElectronicAppResponse({required super.data});

  factory ElectronicAppResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectronicAppResponseFromJson(json);
}
