// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'parentPhone': instance.parentPhone,
      'garde': instance.garde,
    };

Map<String, dynamic> _$SendOtpRequestToJson(SendOtpRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'authType': instance.authType,
      'userType': instance.userType,
      "name": instance.name,
      "parentPhone": instance.parentPhone,
      "grade": instance.grade?.name,
    };
