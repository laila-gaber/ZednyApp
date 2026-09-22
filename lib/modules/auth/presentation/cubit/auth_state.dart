
import '../../data/enum/user_type_enum.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthFormUpdated extends AuthState {
  final UserTypeEnum selectedUserType;
  final bool rememberMe;
  final String selectedGrade;

  AuthFormUpdated({
    required this.selectedUserType,
    required this.rememberMe,
    required this.selectedGrade,
  });
}

class SendOtpLoading extends AuthState {}

class SendOtpSuccess extends AuthState {
  final String refNo;
  final String otp;
  final String phone;

  SendOtpSuccess({
    required this.refNo,
    required this.otp,
    required this.phone,
  });
}

class SendOtpFailure extends AuthState {
  final String message;

  SendOtpFailure(this.message);
}

class VerifyOtpLoading extends AuthState {}

class VerifyOtpSuccess extends AuthState {
  final String token;

  VerifyOtpSuccess(this.token);
}

class VerifyOtpFailure extends AuthState {
  final String message;

  VerifyOtpFailure(this.message);
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String token;
  final String? userType;

  LoginSuccess({
    required this.token,
    this.userType,
  });
}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure(this.message);
}

class OtpTimerTick extends AuthState {
  final int remainingSeconds;

  OtpTimerTick(this.remainingSeconds);
}
