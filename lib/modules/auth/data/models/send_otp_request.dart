import 'package:json_annotation/json_annotation.dart';
import 'package:zedny_app/core/enums/grade_enum.dart';

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

  Map<String, dynamic> toJson() => _$RegisterRequestDtoToJson(this);
}

@JsonSerializable()
class SendOtpRequest {
  final String phone;
  final String authType;
  final String userType;
  final String? name;
  final String? parentPhone;
  final GradeEnum? grade;

  SendOtpRequest({
    required this.phone,
    required this.authType,
    required this.userType,
     this.name,
     this.parentPhone,
     this.grade,
  });

  Map<String, dynamic> toJson() => _$SendOtpRequestToJson(this);
}
