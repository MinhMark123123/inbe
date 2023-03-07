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
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$EmailResponseToJson(EmailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      currentPage: json['current_page'] as int?,
      nextPage: json['next_page'] as int?,
      prevPage: json['prev_page'] as int?,
      totalCount: json['total_count'] as int?,
      totalPages: json['total_pages'] as int?,
      limitValue: json['limit_value'] as int?,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
      'total_pages': instance.totalPages,
      'total_count': instance.totalCount,
      'limit_value': instance.limitValue,
    };
