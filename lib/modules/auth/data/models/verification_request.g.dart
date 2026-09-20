// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationRequest _$VerificationRequestFromJson(Map<String, dynamic> json) =>
    VerificationRequest(
      phone: json['phone'] as String,
      otp: json['otp'] as String,
      refNo: json['rfeNo'] as String,
    );

Map<String, dynamic> _$VerificationRequestToJson(
  VerificationRequest instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'otp': instance.otp,
  'rfeNo': instance.refNo,
};
