import 'package:either_dart/either.dart';
import '../../../../core/extension/extensions.dart';
import '../../../core/network/error_handling.dart';
import '../data/models/login_request.dart';
import '../data/models/login_response.dart';
import '../data/models/send_otp_request.dart';
import '../data/models/send_otp_response.dart';
import '../data/models/verification_request.dart';
import '../data/models/verification_response.dart';
import '../data/repo/repository.dart';
import 'auth_service.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepo _repo;

  AuthServiceImpl(this._repo);

  @override
  Future<Either<MyError, SendOtpResponseData>> sendOtp(
    SendOtpRequest request,
  ) async {
    final result = await _repo.sendOtp(request.toJson());
    return result.map((data) {
      final responseData = SendOtpResponseData.fromJson(data.data);
      sharedPrefs.setString('refNo', responseData.refNo);
      sharedPrefs.setString('otp', responseData.otp);
      sharedPrefs.setString('phone', responseData.phone);
      return responseData;
    });
  }

  @override
  Future<Either<MyError, VerificationResponseData>> verifyOtp(
    VerificationRequest request,
  ) async {
    final result = await _repo.verifyOtp(request.toJson());
    return result.map((data) {
      final responseData = VerificationResponseData.fromJson(data.data);
      sharedPrefs.setString('verification', responseData.token);
      return responseData;
    });
  }

  @override
  Future<Either<MyError, LoginResponseData>> login(
    LoginRequestDto request,
  ) async {
    final result = await _repo.login(request.toJson());
    return result.map((data) {
      final responseData = LoginResponseData.fromJson(data.data);
      sharedPrefs.setString('token', responseData.token);
      if (responseData.userType != null) {
        sharedPrefs.setString('userType', responseData.userType!);
      }
      if (responseData.phone != null) {
        sharedPrefs.setString('phone', responseData.phone!);
      }
      return responseData;
    });
  }
}
