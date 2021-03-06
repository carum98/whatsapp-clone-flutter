import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';
import 'package:whatsapp_clone_flutter/widgets/input_text_filed.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            InputTextField(
              label: 'Email',
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 20),
            InputTextField(
              label: 'Password',
              onChanged: (value) => password = value,
              isPassword: true,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.read<AuthReposoitory>().login(email: email, password: password);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
