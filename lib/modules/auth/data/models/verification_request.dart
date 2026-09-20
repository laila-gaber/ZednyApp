
import 'package:json_annotation/json_annotation.dart';

part 'verification_request.g.dart';

@JsonSerializable()
class VerificationRequest {
  final String phone;
  final String otp;
  @JsonKey(name: 'rfeNo')
  final String refNo;

  VerificationRequest({
    required this.phone,
    required this.otp,
    required this.refNo,
  });

  factory VerificationRequest.fromJson(Map<String, dynamic> json) {
    return _$VerificationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerificationRequestToJson(this);
}
