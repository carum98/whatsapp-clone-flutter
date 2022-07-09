import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';
import 'package:whatsapp_clone_flutter/auth/auth_storage.dart';
import 'package:whatsapp_clone_flutter/core/locator/get_it.dart';

import 'core/theme/theme.dart';

import 'router/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isAuthenticated = await AuthStorage().isAuthenticated();

  setupLocator();

  runApp(MyApp(
    initialRoute: isAuthenticated ? '/' : '/login',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthReposoitory(navigatorKey: getIt(), storage: getIt(), http: getIt()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Theme.light,
        darkTheme: Theme.dark,
        themeMode: ThemeMode.dark,
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
