import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tessprojek/constans/global_variable.dart';

class HomeDummy extends StatelessWidget {
  static const String routeName = '/home-dummy';
  const HomeDummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'ini halaman anjing',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
              },
              child: Text('helow'),
            ),
          ],
        ),
      ),
    );
  }
}
