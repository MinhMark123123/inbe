// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataList _$MetaDataListFromJson(Map<String, dynamic> json) => MetaDataList(
      currentPage: json['current_page'] as int?,
      nextPage: json['next_page'] as int?,
      prevPage: json['prev_page'] as int?,
      totalCount: json['total_count'] as int?,
      totalPages: json['total_pages'] as int?,
      limitValue: json['limit_value'] as int?,
    );

Map<String, dynamic> _$MetaDataListToJson(MetaDataList instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
      'total_pages': instance.totalPages,
      'total_count': instance.totalCount,
      'limit_value': instance.limitValue,
    };
