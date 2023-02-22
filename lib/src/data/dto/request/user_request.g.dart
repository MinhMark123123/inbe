// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      password: json['password'] as String,
      pushNotifications: json['push_notifications'] as String,
      interestCategories: (json['interest_categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'password': instance.password,
      'push_notifications': instance.pushNotifications,
      'interest_categories': instance.interestCategories,
    };
