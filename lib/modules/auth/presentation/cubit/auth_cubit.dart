import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/device_id.dart';
import '../../data/models/login_request.dart';
import '../../data/models/send_otp_request.dart';
import '../../data/models/verification_request.dart';
import '../../services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> sendOtp({
    required String phone,
    required String authType,
    required String userType,
    String? name,
    String? parentPhone,
    String? garde,
    String? fcmToken,
    String? deviceId,
  }) async {
    emit(SendOtpLoading());

    final fcm = fcmToken ?? '';
    final device = deviceId ?? await DeviceId().getDeviceId();

    late SendOtpRequest request;

    if (authType.toLowerCase() == 'register') {
      request = SendOtpRequest(
        phone: phone,
        authType: authType,
        userType: userType,
        registerRequestDto: name != null
            ? RegisterRequestDto(
                fcmToken: fcm,
                deviceId: device,
                name: name,
                parentPhone: parentPhone ?? '',
                garde: garde ?? 'FIRST',
              )
            : null,
      );
    } else {
      request = SendOtpRequest(
        phone: phone,
        authType: authType,
        userType: userType,
      );
    }

    final result = await _authService.sendOtp(request);

    result.fold(
      (error) => emit(SendOtpFailure(error.message ?? 'Failed to send OTP')),
      (data) => emit(SendOtpSuccess(
        refNo: data.refNo,
        otp: data.otp,
        phone: data.phone,
      )),
    );
  }

  Future<void> verifyOtp({
    required String phone,
    required String otp,
    required String refNo,
  }) async {
    emit(VerifyOtpLoading());

    final request = VerificationRequest(
      phone: phone,
      otp: otp,
      refNo: refNo,
    );

    final result = await _authService.verifyOtp(request);

    result.fold(
      (error) =>
          emit(VerifyOtpFailure(error.message ?? 'Failed to verify OTP')),
      (data) => emit(VerifyOtpSuccess(data.token)),
    );
  }

  Future<void> login({
    required String phone,
    required String userType,
    String? fcmToken,
    String? deviceId,
    bool rememberMe = false,
  }) async {
    emit(LoginLoading());

    final fcm = fcmToken ?? '';
    final device = deviceId ?? await DeviceId().getDeviceId();

    final request = LoginRequestDto(
      phone: phone,
      fcmToken: fcm,
      deviceId: device,
      userType: userType,
    );

    final result = await _authService.login(request);

    result.fold(
      (error) => emit(LoginFailure(error.message ?? 'Failed to login')),
      (data) {
        emit(LoginSuccess(
          token: data.token,
          userType: data.userType,
        ));
      },
    );
  }

  void clearAuth() {
    emit(AuthInitial());
  }
}
