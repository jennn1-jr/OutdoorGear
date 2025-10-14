import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ Tambahkan ini

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controller input
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // --- Registrasi dengan Firebase Authentication ---
  void _register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();

    // Validasi field kosong
    if (email.isEmpty || password.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Semua field wajib diisi!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validasi format email sederhana
    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Format email tidak valid!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validasi kecocokan password
    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password dan konfirmasi tidak cocok!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Minimal panjang password
    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password minimal 6 karakter!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // ✅ Registrasi ke Firebase Auth
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registrasi berhasil!"),
          backgroundColor: Colors.green,
        ),
      );

      // Arahkan ke halaman login
      Navigator.pushReplacementNamed(context, "/login");
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Terjadi kesalahan.";
      if (e.code == 'email-already-in-use') {
        errorMessage = "Email sudah digunakan!";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Format email tidak valid!";
      } else if (e.code == 'weak-password') {
        errorMessage = "Password terlalu lemah!";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // Form Registrasi
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Join the Adventure",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Create an account to start your journey.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 30),

                    // Email
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 0, 0, 0)),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password
                    TextField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 0, 0, 0)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Konfirmasi Password
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.lock_clock_outlined,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () => setState(() =>
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2)),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Tombol Register
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Link ke Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: TextStyle(color: Colors.grey[700])),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
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
