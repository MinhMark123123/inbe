// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic_app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectronicAppResponse _$ElectronicAppResponseFromJson(
        Map<String, dynamic> json) =>
    ElectronicAppResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ElectronicAppModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$ElectronicAppResponseToJson(
        ElectronicAppResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };
