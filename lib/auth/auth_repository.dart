import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/core/network/client_http.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';

class AuthReposoitory {
  final GlobalKey<NavigatorState> navigatorKey;
  final Http http;
  final AuthStorage storage;

  const AuthReposoitory({required this.navigatorKey, required this.storage, required this.http});

  void login({required String email, required String password}) async {
    final data = await http.response<Map<String, dynamic>>(
      url: '/login',
      method: Method.post,
      data: {'email': email, 'password': password},
    );

    await storage.setToken(data?['token']);

    navigatorKey.currentState?.pushReplacementNamed(MAIN_PAGE);
  }

  void logout() async {
    await storage.removeToken();

    navigatorKey.currentState?.pushReplacementNamed(LOGIN_PAGE);
  }
}
