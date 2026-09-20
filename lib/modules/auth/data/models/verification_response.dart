import 'package:json_annotation/json_annotation.dart';

part 'verification_response.g.dart';

@JsonSerializable()
class VerificationResponseData {
  final String token;

  VerificationResponseData({
    required this.token,
  });

  factory VerificationResponseData.fromJson(Map<String, dynamic> json) {
    return _$VerificationResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerificationResponseDataToJson(this);
}
