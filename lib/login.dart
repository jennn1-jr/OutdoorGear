import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

void main() {
  runApp(const MyApp());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Dapatkan ukuran layar untuk penyesuaian
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // Kita gunakan Stack untuk menumpuk widget (background & form)
      body: Stack(
        children: [
          // 1. Latar Belakang Gambar
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/background.png"), // Ganti dengan gambar alam kamu
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. Overlay Gelap untuk Keterbacaan
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // 3. Form Login
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // Latar semi-transparan
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                // Batasi lebar maksimum agar terlihat bagus di layar lebar (tablet/web)
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo kamu
                    Image.asset(
                      "assets/images/logo.png", // Path logo tetap sama
                      height: 120, // Ukuran logo disesuaikan
                    ),
                    const SizedBox(height: 20),

                    // Teks sapaan
                    const Text(
                      "Welcome Back, Adventurer!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF172554),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Sign in to continue your journey.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // TextField Email (logika sama, style sedikit diubah)
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon:
                            const Icon(Icons.email, color: Color(0xFF172554)),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide.none, // Hilangkan border default
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color(0xFF172554), width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // TextField Password (logika sama, style sedikit diubah)
                    TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon:
                            const Icon(Icons.lock, color: Color(0xFF172554)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xFF172554),
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color(0xFF172554), width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Tombol Login (logika sama, style sama)
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika navigasi kamu tetap aman di sini
                          Navigator.pushNamed(
                            context,
                            "/home",
                            arguments: {
                              "email": emailController.text,
                              "password": passwordController.text,
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: const Color(0xFF172554),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tombol Register (logika sama, style diubah jadi Row)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun? ",
                            style: TextStyle(color: Colors.grey[700])),
                        GestureDetector(
                          onTap: () {
                            // Logika navigasi kamu tetap aman di sini
                            Navigator.pushNamed(context, "/register");
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              color: Color(0xFF172554),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
