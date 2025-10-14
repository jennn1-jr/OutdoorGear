import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ✅ Sudah benar
import 'package:login_app/home.dart';
import 'package:login_app/login.dart';
import 'package:login_app/register.dart';
import 'package:login_app/SplashScreen.dart';
import 'package:login_app/profilpage.dart';
import 'package:login_app/models/cart_providers.dart'; // ✅ Sudah benar
import 'package:login_app/models/cart_page.dart'; // ✅ import halaman cart
import 'package:firebase_core/firebase_core.dart'; // ✅ import firebase core
import 'firebase_options.dart'; // ✅ import firebase options
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()), // ✅ Sudah benar
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OutdoorGear',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF172554),
        ),
      ),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/home': (context) {
          final args =
              ModalRoute.of(context)?.settings.arguments as Map<String, String>? ??
                  {};
          return HomePage(
            email: args["email"] ?? "User",
            password: args["password"] ?? "",
          );
        },
        '/register': (context) => const RegisterPage(),
        '/profile': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return ProfilePage(
            email: args["email"] ?? "User",
            password: args["password"] ?? "",
          );
        },

        // ✅ Tambahkan route untuk halaman keranjang
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
