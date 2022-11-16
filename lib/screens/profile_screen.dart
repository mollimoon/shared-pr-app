import 'package:auth_with_shared_preferences/data/prefs_keys.dart';
import 'package:auth_with_shared_preferences/main.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(radius: 50,),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(prefs.getString(PrefsKeys.firstName) ?? '',
                  style: const TextStyle(
                  fontSize: 26),
                ),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(prefs.getString(PrefsKeys.lastName) ?? '',
                  style: const TextStyle(
                      fontSize: 26),),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(prefs.getString(PrefsKeys.email) ?? '',
                  style: const TextStyle(
                      fontSize: 26),),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/',);
                    prefs.remove(PrefsKeys.password);
                  },
                  child: const Text("Log out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
