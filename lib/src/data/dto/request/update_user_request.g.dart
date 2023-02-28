// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      nickname: json['nickname'] as String?,
      pushNotifications: json['push_notifications'] as String,
      interestCategories: (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'push_notifications': instance.pushNotifications,
      'interest_categories': instance.interestCategories,
    };
