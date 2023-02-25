import 'package:finance_app/onboarding/Login_screen.dart';
import 'package:finance_app/onboarding/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showSignUp: toggleScreen);
    } else {
      return SignUpScreen(showLoginPage: toggleScreen);
    }
  }
}
