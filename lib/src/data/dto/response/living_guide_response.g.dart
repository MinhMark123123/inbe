// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'living_guide_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LivingGuideResponse _$LivingGuideResponseFromJson(Map<String, dynamic> json) =>
    LivingGuideResponse(
      data: json['data'] as List<dynamic>,
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$LivingGuideResponseToJson(
        LivingGuideResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };
