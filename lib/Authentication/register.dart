
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'authentication.dart';
import 'auth.dart';
import 'login.dart';
import 'package:hexcolor/hexcolor.dart';
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController  = TextEditingController();
TextEditingController emailController  = TextEditingController();

class Register extends StatefulWidget {
   final Function toggleView;
  const Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                SizedBox(height: 30,),
                Text("Register",style: TextStyle(color: Colors.purple,fontSize: 30),),
                SizedBox(height: 40,),
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
                            Icon(Icons.person),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: userNameController,
                                onChanged: (v) => userNameController.text = v,
                                  decoration: InputDecoration(
                                    hintText: "Enter your Username",
                                    enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.purple, width: 2),
	   ),
                                    focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                              Icons.email,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Flexible(
                                child: TextFormField(decoration: InputDecoration(hintText: "Enter Email address",
                                    enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.purple, width: 2),
  
	   ),
                                    focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
		borderSide: BorderSide(color: Colors.purple),
	  ),
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
                            Icon(Icons.vpn_key),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: passwordController,
                                onChanged: (v) => passwordController.text = v,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.purple, width: 2),
	   ),
                                    focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                            Icon(Icons.vpn_key),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: emailController,
                                onChanged: (v) => emailController.text = v,
                                  decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.purple, width: 2),
	   ),
                                    focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
		borderSide: BorderSide(color: Colors.purple),
	  ),
                                  ),
                                 ),
                            ),
                          ],
                        ),
                        
                        Container(
                         
                          child:Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[   
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  Text("Have an account?",style: TextStyle(color: Colors.black),),
                                  SizedBox(width: 5,),
                                   GestureDetector(child: Text("Log in",style: TextStyle(color: HexColor("#0095f6"),),),
                                   onTap: (){
                                     widget.toggleView();
                                   },)
                                ],
                              ),
                            ],
                          ),),
                        
                        
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.purple[400]),
                            onPressed: () async {
                            },
                            child: Text(
                              'Register',
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
