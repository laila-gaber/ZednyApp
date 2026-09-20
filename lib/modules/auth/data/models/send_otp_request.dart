import 'package:json_annotation/json_annotation.dart';

part 'send_otp_request.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  final String fcmToken;
  final String deviceId;
  final String name;
  final String parentPhone;
  final String garde;

  RegisterRequestDto({
    required this.fcmToken,
    required this.deviceId,
    required this.name,
    required this.parentPhone,
    required this.garde,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}

@JsonSerializable()
class SendOtpRequest {
  final String phone;
  final String authType;
  final String userType;
  final RegisterRequestDto? registerRequestDto;

  SendOtpRequest({
    required this.phone,
    required this.authType,
    required this.userType,
    this.registerRequestDto,
  });

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) {
    return _$SendOtpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendOtpRequestToJson(this);
}
