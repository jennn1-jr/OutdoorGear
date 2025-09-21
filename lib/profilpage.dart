import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String password;

  const ProfilePage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    final String username = email.contains('@') ? email.split('@')[0] : email;
    final String maskedPassword = '*' * (password.isNotEmpty ? password.length : 6);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF172554),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 44,
              backgroundColor: const Color(0xFF172554),
              child: Text(
                username.isNotEmpty ? username[0].toUpperCase() : 'U',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text(email),
              ),
            ),
            const SizedBox(height: 8),

            Card(
              child: ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Password'),
                subtitle: Text(maskedPassword),
              ),
            ),

            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // logout -> kembali ke login, ganti route sesuai appmu
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(48),
              ),
            ),

            const Spacer(),
            const Text(
              'Developed by Jennn',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
