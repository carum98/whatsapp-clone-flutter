import 'package:dio/dio.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';

class HttpInterceptor extends Interceptor {
  final AuthStorage storage;
  HttpInterceptor({required this.storage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = await storage.getToken();
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await storage.removeToken();
    }

    super.onError(err, handler);
  }
}
