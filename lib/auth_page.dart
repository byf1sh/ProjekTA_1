import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tessprojek/features/auth/screens/login_screen.dart';
import 'package:tessprojek/features/home/screens/home_dummy.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Menampilkan loading spinner ketika masih menunggu status autentikasi
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Menampilkan pesan kesalahan jika terjadi kesalahan
          return Text('Terjadi kesalahan: ${snapshot.error}');
        } else {
          // Memeriksa apakah pengguna sudah login atau belum
          final user = snapshot.data;
          if (user == null) {
            // Jika pengguna belum login, tampilkan halaman login
            return const LoginScreen();
          } else {
            // Jika pengguna sudah login, tampilkan halaman home
            return const HomeDummy();
          }
        }
      },
    );
  }
}
