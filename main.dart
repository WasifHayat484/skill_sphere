import 'package:flutter/material.dart';
import 'package:skill_sphere/home_screen.dart';
import 'Login_page.dart';
import 'Signup_page.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart';
import 'Register_as.dart';
import 'Signup_page2.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Labor App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      routes: {
        '': (context) => LoginPage(),
        'signup': (context) => RegistrationForm(),
        'registeras':(context) => Showcase(),
        'signup2':(context) => SignupPage(),
      },
      home: const HomeScreen()
    );
  }
}