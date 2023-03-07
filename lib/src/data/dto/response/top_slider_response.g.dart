// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_slider_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopSliderResponse _$TopSliderResponseFromJson(Map<String, dynamic> json) =>
    TopSliderResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => TopSliderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$TopSliderResponseToJson(TopSliderResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };
