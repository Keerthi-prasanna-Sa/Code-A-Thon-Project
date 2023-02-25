// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finance_app/onboarding/Login_screen.dart';
// import 'package:finance_app/screens/home.dart';
import 'package:finance_app/widgets/bottomnavigationbar.dart';
import 'auth_page.dart';
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Bottom();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
