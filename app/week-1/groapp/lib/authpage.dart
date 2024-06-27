import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navi_bar.dart';
import 'login_or_register.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NaviBar();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
