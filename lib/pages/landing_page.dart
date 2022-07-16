import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_flutter/auth/auth_repository.dart';
import 'package:whatsapp_clone_flutter/router/route_names.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to Whatsapp Clone',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/landing-bg.png',
              height: 300,
              width: 300,
              color: const Color(0xFF09a784),
            ),
            const Spacer(),
            const Text('Whatsapp Clone, created by carum98'),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, LOGIN_PAGE),
                  child: const Text('Login'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, REGISTER_PAGE),
                  child: const Text('Register'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<AuthReposoitory>().demo(),
                  child: const Text('Demo'),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
