import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/core/network/client_http.dart';

import '../network/interceptor_http.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Storage
  getIt.registerSingleton<AuthStorage>(AuthStorage());

  // Network
  getIt.registerSingleton<Http>(Http(
    dio: Dio(),
    interceptor: HttpInterceptor(storage: getIt()),
  ));

  // Navigation
  getIt.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());
}
