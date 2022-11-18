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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/main.png'),
                width: 200,
              ),
              // const Text(
              //   'Hello',
              //   style: TextStyle(fontSize: 40),
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailTec,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'E-mail',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordTec,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () => _loginPressed(),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), fixedSize: Size(100, 40), backgroundColor: Colors.black),
                child: const Text('SIGN IN'),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/registration',
                  );
                },
                child: const Text("Don't have an account? Create"),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _loginPressed() {
    final email = prefs.getString(PrefsKeys.email);
    final password = prefs.getString(PrefsKeys.password);
    if (email == emailTec.text && password == passwordTec.text) {
      Navigator.pushNamed(context, '/profile');
    }
  }
}
