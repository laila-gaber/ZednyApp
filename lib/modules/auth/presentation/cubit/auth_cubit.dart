import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zedny_app/core/enums/grade_enum.dart';

import '../../../../core/components/toast_manager.dart';
import '../../../../core/utils/device_id.dart';
import '../../../../generated/l10n.dart';
import '../../data/enum/user_type_enum.dart';
import '../../data/models/login_request.dart';
import '../../data/models/send_otp_request.dart';
import '../../data/models/verification_request.dart';
import '../../services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  // Form Controllers
  final TextEditingController loginPhoneController = TextEditingController();
  final TextEditingController registerPhoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController parentPhoneController = TextEditingController();
  final TextEditingController fcmTokenController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // State Variables
  UserTypeEnum selectedUserType = UserTypeEnum.STUDENT;
  bool rememberMe = false;
  GradeEnum selectedGrade = GradeEnum.FIRST;
  int remainingSeconds = 120;
  Timer? _timer;

  void changeUserType(UserTypeEnum type) {
    selectedUserType = type;
    emit(
      AuthFormUpdated(
        selectedUserType: selectedUserType,
        rememberMe: rememberMe,
        selectedGrade: selectedGrade,
      ),
    );
  }

  void toggleRememberMe(bool? value) {
    rememberMe = value ?? false;
    emit(
      AuthFormUpdated(
        selectedUserType: selectedUserType,
        rememberMe: rememberMe,
        selectedGrade: selectedGrade,
      ),
    );
  }

  void changeGrade(GradeEnum grade) {
    selectedGrade = grade;
    emit(
      AuthFormUpdated(
        selectedUserType: selectedUserType,
        rememberMe: rememberMe,
        selectedGrade: selectedGrade,
      ),
    );
  }

  void startOtpTimer() {
    _timer?.cancel();
    remainingSeconds = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        emit(OtpTimerTick(remainingSeconds));
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> sendLoginOtp(S s) async {
    final phone = loginPhoneController.text.trim();
    if (phone.isEmpty) {
      ToastManager.showError(s.pleaseEnterPhoneNumber);
      return;
    }
    if (phone.length < 11) {
      ToastManager.showError(s.phoneAtLeast11Digits);
      return;
    }

    emit(SendOtpLoading());

    final request = SendOtpRequest(
      phone: phone,
      authType: 'login',
      userType: selectedUserType.name,
    );

    final result = await _authService.sendOtp(request);

    result.fold(
      (error) => emit(SendOtpFailure(error.message ?? 'Failed to send OTP')),
      (data) {
        emit(
          SendOtpSuccess(refNo: data.refNo, otp: data.otp, phone: data.phone),
        );
      },
    );
  }

  Future<void> resendOtp({
    required String phone,
    required String authType,
    required S s,
  }) async {
    emit(SendOtpLoading());

    final fcm = fcmTokenController.text.isNotEmpty
        ? fcmTokenController.text
        : 'fcm_token_placeholder';
    final device = await DeviceId().getDeviceId();

    late SendOtpRequest request;

    if (authType.toLowerCase() == 'register') {
      request = SendOtpRequest(
        phone: phone,
        authType: authType,
        userType: 'STUDENT',
        name: nameController.text.trim(),
        parentPhone: parentPhoneController.text.trim(),
        grade: selectedGrade,
      );
    } else {
      request = SendOtpRequest(
        phone: phone,
        authType: authType,
        userType: selectedUserType.name,
      );
    }

    final result = await _authService.sendOtp(request);

    result.fold(
      (error) => emit(SendOtpFailure(error.message ?? 'Failed to resend OTP')),
      (data) {
        ToastManager.showSuccess(s.otpResent);
        startOtpTimer();
        emit(
          SendOtpSuccess(refNo: data.refNo, otp: data.otp, phone: data.phone),
        );
      },
    );
  }

  String get formattedTimer {
    int minutes = remainingSeconds ~/ 60;
    int secs = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  bool get isOtpExpired => remainingSeconds <= 0;

  Future<void> submitLogin(S s) async {
    final phone = loginPhoneController.text.trim();
    if (phone.isEmpty) {
      ToastManager.showError(s.pleaseEnterPhoneNumber);
      return;
    }

    emit(LoginLoading());

    final fcm = fcmTokenController.text.isNotEmpty
        ? fcmTokenController.text
        : 'fcm_token_placeholder';
    final device = await DeviceId().getDeviceId();

    final request = LoginRequestDto(
      phone: phone,
      fcmToken: fcm,
      deviceId: device,
      userType: selectedUserType.name,
    );

    final result = await _authService.login(request);

    result.fold(
      (error) => emit(LoginFailure(error.message ?? 'Failed to login')),
      (data) {
        emit(LoginSuccess(token: data.token, userType: data.userType));
      },
    );
  }

  Future<void> submitRegister(S s) async {
    final phone = registerPhoneController.text.trim();
    final name = nameController.text.trim();
    final parentPhone = parentPhoneController.text.trim();

    if (phone.isEmpty) {
      ToastManager.showError(s.pleaseEnterPhoneNumber);
      return;
    }
    if (phone.length < 11) {
      ToastManager.showError(s.phoneAtLeast11Digits);
      return;
    }
    if (name.isEmpty) {
      ToastManager.showError(s.pleaseEnterName);
      return;
    }
    if (parentPhone.isEmpty) {
      ToastManager.showError(s.pleaseEnterParentPhone);
      return;
    }

    emit(SendOtpLoading());

    final fcm = fcmTokenController.text.isNotEmpty
        ? fcmTokenController.text
        : 'fcm_token_placeholder';
    final device = await DeviceId().getDeviceId();

    final request = SendOtpRequest(
      phone: phone,
      authType: 'register',
      userType: 'STUDENT',

      name: name,
      parentPhone: parentPhone,
      grade: selectedGrade,
    );

    final result = await _authService.sendOtp(request);

    result.fold(
      (error) => emit(SendOtpFailure(error.message ?? 'Failed to send OTP')),
      (data) => emit(
        SendOtpSuccess(refNo: data.refNo, otp: data.otp, phone: data.phone),
      ),
    );
  }

  Future<void> submitVerifyOtp({
    required String phone,
    required String refNo,
    required String otp,
    required S s,
  }) async {
    if (otp.isEmpty) {
      ToastManager.showError(s.pleaseEnterOtp);
      return;
    }
    if (otp.length < 4) {
      ToastManager.showError(s.otpMustBe4Digits);
      return;
    }

    emit(VerifyOtpLoading());

    final request = VerificationRequest(phone: phone, otp: otp, refNo: refNo);

    final result = await _authService.verifyOtp(request);

    result.fold(
      (error) =>
          emit(VerifyOtpFailure(error.message ?? 'Failed to verify OTP')),
      (data) {
        emit(VerifyOtpSuccess(data.token));
      },
    );
  }

  void clearAuth() {
    emit(AuthInitial());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    loginPhoneController.dispose();
    registerPhoneController.dispose();
    nameController.dispose();
    parentPhoneController.dispose();
    fcmTokenController.dispose();
    otpController.dispose();
    return super.close();
  }
}
