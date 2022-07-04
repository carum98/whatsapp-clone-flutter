import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Login Page'),
            ElevatedButton(
              onPressed: () => AuthReposoitory(context).login(),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
