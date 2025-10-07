
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String password;

  const ProfilePage({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    final String username = email.contains('@') ? email.split('@')[0] : email;
    final String maskedPassword = '*' * (password.isNotEmpty ? password.length : 6);

    // Ganti dengan path gambar avatarmu di folder assets
    const String avatarAssetPath = "assets/images/fais.png";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
           
            const GFAvatar(
              size: GFSize.LARGE,
              backgroundImage: AssetImage(avatarAssetPath), 
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
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
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
