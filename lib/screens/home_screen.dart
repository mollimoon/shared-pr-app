import 'package:auth_with_shared_preferences/data/prefs_keys.dart';
import 'package:auth_with_shared_preferences/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final emailTec = TextEditingController();
  final passwordTec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
        child: ListView(
          children: [
            const Text(
              'Hello',
              style: TextStyle(fontSize: 26),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailTec,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  TextField(
                obscureText: true,
                controller: passwordTec,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => _loginPressed(),
              child: const Text('SIGN IN'),
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/registration',);
              },
              child: const Text("Don't have an account? Create"),
            ),
          ],
        ),
      ),
    ));
  }
  Future<void> _loginPressed() async {
    final email = prefs.getString(PrefsKeys.email);
    final password = prefs.getString(PrefsKeys.password);
    if (email == emailTec.text && password == passwordTec.text) {
      Navigator.pushNamed(context, '/profile');
    }
  }
}
