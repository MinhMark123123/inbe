// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailResponse _$EmailResponseFromJson(Map<String, dynamic> json) =>
    EmailResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MetaDataList.fromJson(json['meta'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$EmailResponseToJson(EmailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
      'meta': instance.meta,
    };
