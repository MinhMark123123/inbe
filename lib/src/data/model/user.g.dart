// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      nickname: json['nickname'] as String?,
      pushNotifications: json['push_notifications'] as bool?,
      interestCategories: (json['interest_categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    )..message = json['message'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'message': instance.message,
      'nickname': instance.nickname,
      'push_notifications': instance.pushNotifications,
      'interest_categories': instance.interestCategories,
    };
