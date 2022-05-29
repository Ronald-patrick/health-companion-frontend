// ignore_for_file: avoid_unnecessary_containers, void_checks, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:miniproject/api/api.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({required this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        elevation: 0,
        toolbarHeight: 30,
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/3.svg'),
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Log In",
            style: TextStyle(color: Colors.purple, fontSize: 30),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.email),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Email address",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.vpn_key,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Passowrd',
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              "Don't have account?",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: HexColor("#0095f6"),
                                ),
                              ),
                              onTap: () {
                                widget.toggleView();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.purple[400]),
                      onPressed: () async {
                        Api().login(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
