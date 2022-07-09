import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Main Page'),
            ElevatedButton(
              onPressed: () => context.read<AuthReposoitory>().logout(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
