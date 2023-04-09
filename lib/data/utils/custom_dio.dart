import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dummy_app/data/global_constants/api_data.dart';

abstract class CustomDio {
  static final Dio _dio = Dio();
  static final Options _options = Options(headers: {'app-id': ApiData.appId});

  static Future<Response?> get(String url) async {
    try {
      return await _dio.get(url, options: _options);
    } catch (error) {
      log(error.toString());
      log(url);
      return null;
    }
  }
}
