import 'package:auth_with_shared_preferences/data/prefs_keys.dart';
import 'package:auth_with_shared_preferences/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final firstNameTec = TextEditingController();
  final lastNameTec = TextEditingController();
  final emailTec = TextEditingController();
  final passwordTec = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const CircleAvatar(radius: 50,),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: firstNameTec,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: lastNameTec,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailTec,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail address',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child:  TextField(
              controller: passwordTec,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _onCreatePressed(context),
            child: const Text('CREATE'),
          ),
        ],
      ),
    ),);
  }

  Future<void> _onCreatePressed(BuildContext context) async { // объявили ассинхр фун-ю
    await prefs.setString(PrefsKeys.firstName, firstNameTec.text); //save data in Sh.pr.
    await prefs.setString(PrefsKeys.lastName, lastNameTec.text);
    await prefs.setString(PrefsKeys.email, emailTec.text);
    await prefs.setString(PrefsKeys.password, passwordTec.text);
    Navigator.pop(context);
  }
}

