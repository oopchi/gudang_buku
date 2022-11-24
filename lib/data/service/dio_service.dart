import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  final int _timeOut = 60000;

  void _printLogs(Object args) {
    debugPrint(args as String);
  }

  void _onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    return handler.resolve(
      err.response ??
          Response(
            requestOptions: RequestOptions(
              path: '',
            ),
          ),
    );
  }

  Dio get dio => Dio()
    ..options.baseUrl = dotenv.env['BASE_URL']!
    ..options.connectTimeout = _timeOut
    ..options.headers = <String, String>{
      HttpHeaders.acceptHeader: 'application/vnd.github+json',
      HttpHeaders.contentTypeHeader: 'application/vnd.github+json',
    }
    ..interceptors.addAll(
      <Interceptor>[
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          logPrint: _printLogs,
        ),
        InterceptorsWrapper(
          onError: _onError,
        ),
      ],
    );
}
