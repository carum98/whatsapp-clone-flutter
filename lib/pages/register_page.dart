import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';
import 'package:whatsapp_clone_flutter/widgets/input_text_filed.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = '', password = '', name = '', phone = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            InputTextField(
              label: 'Name',
              onChanged: (value) => name = value,
            ),
            const SizedBox(height: 20),
            InputTextField(
              label: 'Email',
              onChanged: (value) => email = value,
            ),
            const SizedBox(height: 20),
            InputTextField(
              label: 'Phone',
              onChanged: (value) => phone = value,
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
                context
                    .read<AuthReposoitory>()
                    .register(email: email, password: password, name: name, phone: phone);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
