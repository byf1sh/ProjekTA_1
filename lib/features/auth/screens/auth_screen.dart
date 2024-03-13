import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tessprojek/common/widgets/custom_textfield.dart';
import 'package:tessprojek/features/auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:tessprojek/features/auth/screens/login_screen.dart';
import 'package:tessprojek/features/auth/services/auth_service.dart';
import 'package:tessprojek/features/auth/services/google_auth_service.dart';
import 'package:tessprojek/features/home/screens/home_screen.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _repeatpasswordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 40),
              child: const Text(
                'Book-it',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OutfitBlod'),
              ),
            ),
            const Text(
              'Book with Ease, Anytime, Anywhere!',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'OutfitLight'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 370,
              height: 50,
              child: ElevatedButton(
                onPressed: () => GoogleAuthService().signInWithGoogle(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  // Tetap gunakan padding yang sesuai
                  padding:
                      const EdgeInsets.symmetric(horizontal: 105, vertical: 10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Widget untuk gambar
                    Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: Image.asset(
                        'assets/images/google-logo.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    // Widget untuk teks
                    Text(
                      'Sign up with Google',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'OutfitBlod',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'or',
              style: TextStyle(
                fontFamily: 'OutfitBlod',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Form(
              key: _signUpFormKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 38, right: 10, top: 10),
                          child: CustomTextField(
                              controller: _nameController,
                              hintText: 'First Name'),
                        ),
                      ),
                      // Spasi antara dua TextField
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 1, right: 38, top: 10),
                          child: CustomTextField(
                              controller: _lastnameController,
                              hintText: 'Last Name'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 10),
                    child: CustomTextField(
                      controller: _emailController,
                      hintText: 'E-mail',
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 38, vertical: 0),
                    child: CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 38, vertical: 10),
                    child: CustomTextField(
                      controller: _repeatpasswordController,
                      hintText: 'Repeat password',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_signUpFormKey.currentState!.validate()) {
                          signUpUser();
                          _signUp();
                        }
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontFamily: 'OutfitBlod',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 127, vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an accont?',
                        style: TextStyle(
                          fontFamily: 'OutfitBlod',
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0077B2),
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Tambahkan logika yang ingin Anda jalankan ketika teks ditekan di sini
                          // Misalnya, untuk menavigasi ke layar login, Anda dapat menggunakan Navigator
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'OutfitBlod',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("Succesfully created");
      Navigator.pushNamed(context, HomeScreen.routeName);
    } else {
      print('some error occured');
    }
  }
}
