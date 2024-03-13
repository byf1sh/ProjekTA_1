import 'package:flutter/material.dart';
import 'package:tessprojek/common/widgets/bottom_bar.dart';
import 'package:tessprojek/features/admin/screens/add_product_screen.dart';
import 'package:tessprojek/features/auth/screens/login_screen.dart';
import 'package:tessprojek/features/home/screens/home_dummy.dart';
import 'package:tessprojek/features/home/screens/home_screen.dart';
import 'package:tessprojek/features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case HomeDummy.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeDummy(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
