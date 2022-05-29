import 'dart:async';

import 'package:flutter/material.dart';
import 'package:miniproject/Screens/Predict/predict.dart';
import 'package:miniproject/Screens/Welcome/components/body.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/constants.dart';
import 'package:miniproject/home.dart';
import 'package:miniproject/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

var autologin;

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final SecureStorage secureStorage = new SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData('token').then((value) {
      autologin = value;
      print(autologin);
    });
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => autologin == null
                    ? Scaffold(
                        body: Body(),
                      )
                    : MyStatefulWidget()),
            (Route<dynamic> route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(autologin);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
