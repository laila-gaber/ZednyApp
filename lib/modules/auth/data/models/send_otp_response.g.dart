// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendOtpResponseData _$SendOtpResponseDataFromJson(Map<String, dynamic> json) =>
    SendOtpResponseData(
      phone: json['phone'] as String,
      otp: json['otp'] as String,
      refNo: json['rfeNo'] as String,
      expired: json['expired'] as bool,
      authType: json['authType'] as String,
      token: json['token'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$SendOtpResponseDataToJson(
  SendOtpResponseData instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'otp': instance.otp,
  'rfeNo': instance.refNo,
  'expired': instance.expired,
  'authType': instance.authType,
  'token': instance.token,
  'createdAt': instance.createdAt,
};
