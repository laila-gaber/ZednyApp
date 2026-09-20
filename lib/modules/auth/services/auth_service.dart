import 'package:either_dart/either.dart';
import '../../../core/network/error_handling.dart';
import '../data/models/login_request.dart';
import '../data/models/login_response.dart';
import '../data/models/send_otp_request.dart';
import '../data/models/send_otp_response.dart';
import '../data/models/verification_request.dart';
import '../data/models/verification_response.dart';

abstract class AuthService {
  Future<Either<MyError, SendOtpResponseData>> sendOtp(
    SendOtpRequest request,
  );

  Future<Either<MyError, VerificationResponseData>> verifyOtp(
    VerificationRequest request,
  );

  Future<Either<MyError, LoginResponseData>> login(
    LoginRequestDto request,
  );
}
