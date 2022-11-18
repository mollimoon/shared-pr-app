import 'package:auth_with_shared_preferences/screens/home_screen.dart';
import 'package:auth_with_shared_preferences/screens/profile_screen.dart';
import 'package:auth_with_shared_preferences/screens/registration_screen.dart';
import 'package:auth_with_shared_preferences/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  //есть есть какие-то действия помимо runApp
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    ),
  );
}
