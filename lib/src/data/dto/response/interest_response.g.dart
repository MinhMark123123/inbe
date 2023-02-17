// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestResponse _$InterestResponseFromJson(Map<String, dynamic> json) =>
    InterestResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$InterestResponseToJson(InterestResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };
