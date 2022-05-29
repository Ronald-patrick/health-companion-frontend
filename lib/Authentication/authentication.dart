// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:miniproject/Authentication/auth.dart';

import 'login.dart';

class Authentication extends StatefulWidget {
  const Authentication({ Key? key }) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Authenticate();}
    
  }
