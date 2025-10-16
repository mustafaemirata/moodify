import 'package:flutter/material.dart';
import 'package:moodify/service/auth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(title: Text("Hoş Geldiniz")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SignInWithAppleButton(
            onPressed: () => authService.signInWithApple(),
          ),
        ),
      ),
    );
  }
}
