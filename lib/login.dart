import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  Future<void> _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email dan password harus diisi!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 🔥 Login ke Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ Jika berhasil
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login berhasil!"),
          backgroundColor: Colors.green,
        ),
      );

      // Arahkan ke halaman home
      Navigator.pushReplacementNamed(
        context,
        "/home",
        arguments: {"email": email, "password": password},
      );
    } on FirebaseAuthException catch (e) {
      // ⚠️ Tangani error Firebase
      String message;
      if (e.code == 'user-not-found') {
        message = "Akun tidak ditemukan!";
      } else if (e.code == 'wrong-password') {
        message = "Password salah!";
      } else {
        message = e.message ?? "Terjadi kesalahan.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    } catch (e) {
      // Error lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e"), backgroundColor: Colors.red),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌄 Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // 🧾 Form Login
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/logo.png", height: 120),
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome Back, Adventurer!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Sign in to continue your journey.",
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 30),

                    // 📧 Email Field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 🔒 Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
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
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 🚀 Tombol Login
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔗 Link ke Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun? ",
                            style: TextStyle(color: Colors.grey[700])),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              color: Colors.black,
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
