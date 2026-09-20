// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDto _$LoginRequestDtoFromJson(Map<String, dynamic> json) =>
    LoginRequestDto(
      phone: json['phone'] as String,
      fcmToken: json['fcmToken'] as String,
      deviceId: json['deviceId'] as String,
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$LoginRequestDtoToJson(LoginRequestDto instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'fcmToken': instance.fcmToken,
      'deviceId': instance.deviceId,
      'userType': instance.userType,
    };
