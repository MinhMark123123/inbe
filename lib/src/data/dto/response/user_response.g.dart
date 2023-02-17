// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UseResponse _$UseResponseFromJson(Map<String, dynamic> json) => UseResponse(
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$UseResponseToJson(UseResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };
