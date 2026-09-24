import 'student_profile_dto.dart';

class StudentUserDto {
  final String? ref;
  final String? deviceId;
  final String? oneSignalId;
  final String? userType;
  final StudentProfileDto? profile;

  StudentUserDto({
    this.ref,
    this.deviceId,
    this.oneSignalId,
    this.userType,
    this.profile,
  });

  factory StudentUserDto.fromJson(Map<String, dynamic> json) {
    return StudentUserDto(
      ref: json['ref'] as String?,
      deviceId: json['deviceId'] as String?,
      oneSignalId: json['oneSignalId'] as String?,
      userType: json['userType'] as String?,
      profile: json['profile'] != null
          ? StudentProfileDto.fromJson(json['profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'ref': ref,
        'deviceId': deviceId,
        'oneSignalId': oneSignalId,
        'userType': userType,
        'profile': profile?.toJson(),
      };
}
