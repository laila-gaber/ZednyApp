import 'package:either_dart/either.dart';
import '../../../../core/api/api_endpoints.dart';
import '../../../../core/models/response_dto/response_dto.dart';
import '../../../../core/network/error_handling.dart';
import '../../../../core/network/network_handler.dart';

class AuthRepo {
  final api = NetworkHandler();

  Future<Either<MyError, ResponseDto>> sendOtp(Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.sendOtp,
      data: data,
      object: null,
      withToken: false,
    );
  }

  Future<Either<MyError, ResponseDto>> verifyOtp(Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.verifyOtp,
      data: data,
      object: null,
      withToken: false,
    );
  }

  Future<Either<MyError, ResponseDto>> login(Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.loginWithPhone,
      data: data,
      object: null,
      withToken: false,
    );
  }

  Future<Either<MyError, ResponseDto>> register(Map<String, dynamic> data) {
    return api.postDataToServer(
      url: Endpoints.registerWithPhone,
      data: data,
      object: null,
      withToken: false,
    );
  }
}
