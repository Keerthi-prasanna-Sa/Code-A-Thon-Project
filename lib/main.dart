import 'package:finance_app/onboarding/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:finance_app/widgets/bottomnavigationbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finance_app/onboarding/Login_screen.dart';
import 'data/model/add_date.dart';
import 'package:finance_app/provider/auth_provider.dart';
import 'onboarding/splash_screen.dart';
import 'onboarding/main_page.dart';
import 'package:provider/provider.dart';
import 'onboarding/splash_screen.dart';
import 'package:finance_app/data/model/routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finance Management App',
        initialRoute: '/',
        home: SplashScreen(title: "Finance app"),

        // routes: {
        //   "/" : (context)=> SplashScreen(title: 'Finology'),
        //  // "":(context) => LoginScreen(key: key),
        //  Routes.loginScreen: (context) => LoginScreen(),
        //  Routes.signUpScreen: (context)=> SignUpScreen()
        // }
      ),
    );
  }
}
