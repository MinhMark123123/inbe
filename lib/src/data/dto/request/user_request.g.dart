// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      password: json['password'] as String,
      pushNotifications: json['pushNotifications'] as String,
      interestCategories: (json['interestCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'nickname': instance.nickname,
      'password': instance.password,
      'pushNotifications': instance.pushNotifications,
      'interestCategories': instance.interestCategories,
    };
