import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';

import 'router/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isAuthenticated = await AuthStorage().isAuthenticated();

  runApp(MyApp(
    initialRoute: isAuthenticated ? '/' : '/login',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
