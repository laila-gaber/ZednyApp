import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequestDto {
  final String phone;
  final String fcmToken;
  final String deviceId;
  final String userType;

  LoginRequestDto({
    required this.phone,
    required this.fcmToken,
    required this.deviceId,
    required this.userType,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}
