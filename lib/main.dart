import 'package:flutter/material.dart';
import 'package:finance_app/auth/main_page.dart';
//importing firebase dependencies
import 'package:firebase_core/firebase_core.dart';
import 'package:finance_app/widgets/bottomnavigationbar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/model/add_date.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(finance_app());
}

class finance_app extends StatelessWidget {
  const finance_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
