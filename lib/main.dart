import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moodify/firebase_options.dart';
import 'package:moodify/pages/home_screen.dart';
import 'package:moodify/pages/login_page.dart';
import 'package:moodify/service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //auth kısmı
    final authService = AuthService();

    return MaterialApp(
      home: StreamBuilder(
        stream: authService.authStateChanges(),
        builder: (context, snapshot) {
          //yükleme
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            //doğrulama olmazsa
            if (user == null) {
              return const LoginPage();
            } else {
              return const HomeScreen();
            }
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
