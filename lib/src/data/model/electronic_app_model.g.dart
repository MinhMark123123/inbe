// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electronic_app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElectronicAppModel _$ElectronicAppModelFromJson(Map<String, dynamic> json) =>
    ElectronicAppModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      middleCategories: (json['middleCategories'] as List<dynamic>?)
          ?.map((e) => MiddleCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectronicAppModelToJson(ElectronicAppModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'middleCategories': instance.middleCategories,
    };

MiddleCategories _$MiddleCategoriesFromJson(Map<String, dynamic> json) =>
    MiddleCategories(
      id: json['id'] as int?,
      name: json['name'] as String?,
      procedures: (json['procedures'] as List<dynamic>?)
          ?.map((e) => Procedures.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MiddleCategoriesToJson(MiddleCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'procedures': instance.procedures,
    };

Procedures _$ProceduresFromJson(Map<String, dynamic> json) => Procedures(
      name: json['name'] as String?,
      detailUrl: json['detailUrl'] as String?,
      formUrl: json['formUrl'] as String?,
    );

Map<String, dynamic> _$ProceduresToJson(Procedures instance) =>
    <String, dynamic>{
      'name': instance.name,
      'detailUrl': instance.detailUrl,
      'formUrl': instance.formUrl,
    };
