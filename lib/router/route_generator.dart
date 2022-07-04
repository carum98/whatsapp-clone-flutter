import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';

import '../pages/login_page.dart';
import '../pages/main_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case LOGIN_PAGE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route')),
          ),
        );
    }
  }
}
