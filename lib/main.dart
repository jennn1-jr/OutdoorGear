import 'package:flutter/material.dart';
import 'package:login_app/home.dart';
import 'package:login_app/login.dart';
import 'package:login_app/register.dart';
import 'package:login_app/SplashScreen.dart';
import 'package:login_app/profilpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jennn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF172554),
        ),
      ),
      // 👇 jangan pakai "home:" lagi
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        "/profile": (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return ProfilePage(
            email: args["email"] ?? "User",
            password: args["password"] ?? "",
          );
        },
      },
    );
  }
}
