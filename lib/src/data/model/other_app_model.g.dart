// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherAppModel _$OtherAppModelFromJson(Map<String, dynamic> json) =>
    OtherAppModel(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      content: json['content'] as String?,
      iosApp: json['ios_app'] as String?,
      androidApp: json['android_app'] as String?,
    );

Map<String, dynamic> _$OtherAppModelToJson(OtherAppModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'content': instance.content,
      'ios_app': instance.iosApp,
      'android_app': instance.androidApp,
    };
