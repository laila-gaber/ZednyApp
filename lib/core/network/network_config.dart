import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/api_endpoints.dart';
import '../extension/extensions.dart';

class NetworkConfig {
  Dio httpClient(bool withToken, {String? languageCode}) {
    final Dio dio = Dio();

    String? token = sharedPrefs.getString('token');
    String? verification = sharedPrefs.getString('verification');

    dio.options = BaseOptions(
        baseUrl: Endpoints.testServerBaseUrl,
        connectTimeout: const Duration(seconds: 20),
        contentType: 'application/json',
        headers: {
          if (withToken && token != null) 'Authorization': 'Bearer $token',
          if (verification != null) 'Verification': verification,
          'Accept-Language': languageCode ?? 'ar',
          'lat': (sharedPrefs.getString("lat")??"").isEmpty?"0.0":sharedPrefs.getString("lat"),
          "lng":  (sharedPrefs.getString("long")??"").isEmpty?"0.0":sharedPrefs.getString("long"),
          'notifId': '${sharedPrefs.getString("notifId")}',
          'X-API-Key': '9776f587-d9e3-40af-a6c2-8ffa3873e01c',
          'lang': languageCode ?? 'ar'
        });
    return dio;
  }
}
