import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tessprojek/auth_page.dart';
import 'package:tessprojek/common/widgets/bottom_bar.dart';
import 'package:tessprojek/constans/global_variable.dart';
import 'package:tessprojek/features/admin/screens/admin_screen.dart';
import 'package:tessprojek/features/auth/screens/auth_screen.dart';
import 'package:tessprojek/features/auth/screens/login_screen.dart';
import 'package:tessprojek/features/auth/services/auth_service.dart';
import 'package:tessprojek/features/home/screens/home_dummy.dart';
import 'package:tessprojek/features/home/screens/home_screen.dart';
import 'package:tessprojek/providers/user_provider.dart';
import 'package:tessprojek/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book-it App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: AuthPage(),
    );
  }
}
