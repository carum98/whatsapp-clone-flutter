import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';

class AuthReposoitory {
  final BuildContext context;
  const AuthReposoitory(this.context);

  void login() async {
    await AuthStorage().setToken('token');

    toMain();
  }

  void logout() async {
    await AuthStorage().removeToken();

    toLogin();
  }

  void toLogin() {
    Navigator.pushReplacementNamed(context, LOGIN_PAGE);
  }

  void toMain() {
    Navigator.pushReplacementNamed(context, MAIN_PAGE);
  }
}
