import 'package:dio/dio.dart';
import 'package:whatsapp_clone_flutter/core/app_config.dart';
import 'package:whatsapp_clone_flutter/core/network/exceptions_http.dart';
import 'package:whatsapp_clone_flutter/core/network/interceptor_http.dart';

enum Method {
  get,
  post,
  put,
}

class Http {
  final Dio dio;
  final HttpInterceptor interceptor;

  Http({required this.dio, required this.interceptor}) {
    dio.interceptors.add(interceptor);

    dio.options.baseUrl = AppConfig.baseApiUrl;

    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;

    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    dio.options.contentType = Headers.jsonContentType;
  }

  Future<T?> response<T>({
    required String url,
    Method method = Method.get,
    Map<String, dynamic>? data,
    T Function(Map<String, dynamic>)? mapper,
  }) async {
    try {
      late final Response response;

      if (method == Method.get) {
        response = await dio.get(url, queryParameters: data);
      } else if (method == Method.post) {
        response = await dio.post(url, data: data);
      } else if (method == Method.put) {
        response = await dio.put(url, data: data);
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = response.data;

        if (mapper != null) {
          return mapper(body);
        }

        return body as T;
      } else {
        throw Exception('${response.statusCode} ${response.statusMessage}');
      }
    } on DioError catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }
}
