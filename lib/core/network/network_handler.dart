import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';

import '../models/response_dto/response_dto.dart';
import 'error_handling.dart';
import 'network_config.dart';

class NetworkHandler {
  Future<Either<MyError, Response>> safe(Future<Response> request) async {
    try {
      return Right(await request);
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return Left(MyError(key: AppError.BadRequest, message: e.toString()));
    }
  }

  Either<MyError, Response> checkHttpStatus(Response response) {
    if (response.statusCode == 200) {
      final body = response.data;
      if (kDebugMode) {
        log(body.toString());
      }

      int code = body['code'] ?? 200;

      if (code >= 301 && code <= 304) {
        return Left(MyError(
          key: AppError.SomeThingWrong,
          message: "${body['errormessage']}",
        ));
      }

      return Right(response);
    }

    return Left(MyError(
      key: AppError.BadResponse,
      message: "Bad response: ${response.statusCode}",
    ));
  }

  Future<Either<MyError, Map<String, dynamic>>> parseJson(
      Response response) async {
    try {
      return (response.data['status'])
          ? Right(response.data)
          : Left(MyError(
          key: AppError.JsonParsing, message: response.data['message']));
    } catch (e) {
      log(e.toString());
      return const Left(MyError(
          key: AppError.JsonParsing, message: "JSON parsing error"));
    }
  }

  final networkConfig = NetworkConfig();

  Future<Either<MyError, ResponseDto>> getDataFromServer(
      {required String url,
        dynamic object,
        bool? withToken,
        Map<String, dynamic>? queryParameters}) async {
    final http = networkConfig.httpClient(withToken ?? true);
    log('GET:$url');
    return safe(http.get(url, queryParameters: queryParameters))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight(ResponseDto.fromJson);
  }

  Future<Either<MyError, ResponseDto>> postDataToServer(
      {required String url,
        bool? withToken,
        required dynamic data,
        required dynamic object}) async {
    final http = networkConfig.httpClient(withToken ?? true);

    if (kDebugMode) {
      log('POST:$url');
      log('DATA:${data.toString()}');
    }

    return safe(http.post(url, data: data))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight(ResponseDto.fromJson);
  }

  Future<Either<MyError, ResponseDto>> putDataToServer(
      {required String url,
        required dynamic data,
        bool? withToken,
        required dynamic object}) async {
    final http = networkConfig.httpClient(withToken ?? true);

    if (kDebugMode) {
      log('PUT:$url');
      log('DATA:${data.toString()}');
    }

    return safe(http.put(url, data: data))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight(ResponseDto.fromJson);
  }

  Future<Either<MyError, ResponseDto>> deleteDataFromServer(
      {required String url,
        dynamic object,
        bool? withToken,
        Map<String, dynamic>? queryParameters}) async {
    final http = networkConfig.httpClient(withToken ?? true);
    log('Delete:$url');
    return safe(http.delete(url, queryParameters: queryParameters))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight(ResponseDto.fromJson);
  }

  Future<Either<MyError, ResponseDto>> uploadFiles({
    required String url,
    required imageBytes,
    required fileName,
    bool? withToken,
  }) async {
    final http = networkConfig.httpClient(withToken ?? true);

    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(imageBytes, filename: fileName),
    });

    return safe(http.post(url, data: formData))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight(ResponseDto.fromJson);
  }

  Future<Either<MyError, ResponseDto>> uploadMultiFiles(
      {required String url,
        bool? withToken,
        required List imageBytes,
        required String fileName}) async {
    final http = networkConfig.httpClient(withToken ?? true);

    FormData formData = FormData.fromMap({"name": 'complain_'});

    for (int i = 0; i < imageBytes.length; i++) {
      formData.files.addAll([
        MapEntry("file",
            MultipartFile.fromBytes(imageBytes[i], filename: '$fileName$i.png'))
      ]);
    }
    return safe(http.post(url, data: formData))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight(ResponseDto.fromJson);
  }

  Future<Either<MyError, dynamic>> getLocationData({
    required String url,
    dynamic object,
    bool? withToken,
  }) async {
    final http = networkConfig.httpClient(withToken ?? true);

    return safe(http.get(url)).either((left) => left, (right) => right.data);
  }

  Future<bool> checkInternet() async {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    try {
      final response =
      await dio.head('https://clients3.google.com/generate_204');
      return response.statusCode != null && response.statusCode! < 400;
    } catch (_) {
      return false;
    }
  }
}
