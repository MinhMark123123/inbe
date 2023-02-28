// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoRequest _$UpdateUserInfoRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$UpdateUserInfoRequestToJson(
        UpdateUserInfoRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'otp': instance.otp,
    };
