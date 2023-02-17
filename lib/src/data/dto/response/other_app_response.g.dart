// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherAppResponse _$OtherAppResponseFromJson(Map<String, dynamic> json) =>
    OtherAppResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => OtherAppModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$OtherAppResponseToJson(OtherAppResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };
