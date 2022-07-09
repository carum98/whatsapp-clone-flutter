import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', password = '';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Login Page'),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) => email = value,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (value) => password = value,
            ),
            ElevatedButton(
              onPressed: () =>
                  context.read<AuthReposoitory>().login(email: email, password: password),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
