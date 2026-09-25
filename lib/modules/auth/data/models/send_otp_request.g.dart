// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    RegisterRequestDto(
      fcmToken: json['fcmToken'] as String,
      deviceId: json['deviceId'] as String,
      name: json['name'] as String,
      parentPhone: json['parentPhone'] as String,
      garde: json['garde'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(RegisterRequestDto instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'deviceId': instance.deviceId,
      'name': instance.name,
      'parentPhone': instance.parentPhone,
      'garde': instance.garde,
    };

SendOtpRequest _$SendOtpRequestFromJson(Map<String, dynamic> json) =>
    SendOtpRequest(
      phone: json['phone'] as String,
      authType: json['authType'] as String,
      userType: json['userType'] as String,
      name: json['name'] as String?,
      parentPhone: json['parentPhone'] as String?,
      grade: $enumDecodeNullable(_$GradeEnumEnumMap, json['grade']),
    );

Map<String, dynamic> _$SendOtpRequestToJson(SendOtpRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'authType': instance.authType,
      'userType': instance.userType,
      'name': instance.name,
      'parentPhone': instance.parentPhone,
      'grade': _$GradeEnumEnumMap[instance.grade],
    };

const _$GradeEnumEnumMap = {
  GradeEnum.FIRST: 'FIRST',
  GradeEnum.SECOND: 'SECOND',
  GradeEnum.THIRD: 'THIRD',
};
