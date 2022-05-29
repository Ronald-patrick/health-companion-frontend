// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:miniproject/Screens/Predict/components/predict_body.dart';
import 'package:miniproject/Screens/Predict/predict.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Diet/selectdiet.dart';
import 'Screens/Signup/signup_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:miniproject/Screens/Welcome/welcome_screen.dart';
import 'package:miniproject/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(loggedValue);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
