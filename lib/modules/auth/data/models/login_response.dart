import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseData {
  final String token;
  final String? userType;
  final String? phone;

  LoginResponseData({
    required this.token,
    this.userType,
    this.phone,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}
