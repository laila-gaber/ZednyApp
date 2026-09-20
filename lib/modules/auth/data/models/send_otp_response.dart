import 'package:json_annotation/json_annotation.dart';

part 'send_otp_response.g.dart';

@JsonSerializable()
class SendOtpResponseData {
  final String phone;
  final String otp;
  @JsonKey(name: 'rfeNo')
  final String refNo;
  final bool expired;
  final String authType;
  final String? token;
  final int createdAt;

  SendOtpResponseData({
    required this.phone,
    required this.otp,
    required this.refNo,
    required this.expired,
    required this.authType,
    this.token,
    required this.createdAt,
  });

  factory SendOtpResponseData.fromJson(Map<String, dynamic> json) {
    return _$SendOtpResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendOtpResponseDataToJson(this);
}
