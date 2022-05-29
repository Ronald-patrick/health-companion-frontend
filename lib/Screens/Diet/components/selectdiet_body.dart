// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_null_comparison

import 'dart:io';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniproject/Screens/Signup/components/background.dart';
import 'package:miniproject/Screens/Welcome/welcome_screen.dart';

import 'package:miniproject/components/rounded_button.dart';
import 'package:miniproject/constants.dart';
import 'package:miniproject/home.dart';
import 'package:miniproject/storage/storage.dart';

class SelectDietComponent extends StatefulWidget {
  const SelectDietComponent({Key? key}) : super(key: key);

  @override
  _SelectDietComponentState createState() => _SelectDietComponentState();
}

class _SelectDietComponentState extends State<SelectDietComponent> {
  SecureStorage secureStorage = SecureStorage();
  String? dropDownValue;
  String? dropDownValue2;
  String? dropDownValue3;

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Center(
          child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
        onPressed: () async {
          await secureStorage.DeleteSecureData("token").whenComplete(() async {
            var abc = await secureStorage.readSecureData("token");
            print(abc);
            print("insode");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
                (Route<dynamic> route) => false);
          });
        },
        child: Text("sign Out"),
      )),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: <Widget>[
      //         Text(
      //           "Select Diet",
      //           style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 21),
      //         ),
      //         SizedBox(height: size.height * 0.11),
      //        Container(
      //          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: HexColor("#f8d8df")),
      //          padding: EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
      //          height:50 ,
      //          width: 180,
      //          child: DropdownButton(
      //            dropdownColor: HexColor("#f8e7eb"),
      //            borderRadius: BorderRadius.circular(7),
      //   hint: dropDownValue == null
      //       ? Text('Nutirents',style: TextStyle(fontSize: 19),)
      //       : Text(
      //             dropDownValue!,
      //             style: TextStyle(color: kPrimaryColor),
      //           ),
      //   isExpanded: true,
      //   iconSize: 30.0,
      //   icon: dropDownValue==null? Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
      //   style: TextStyle(color: kPrimaryColor,fontSize: 19),
      //   items: ['Protien', 'Carbohydrates', 'Fibers'].map(
      //     (val) {
      //       return DropdownMenuItem<String>(
      //           value: val,
      //           child: Text(val),
      //       );
      //     },
      //   ).toList(),
      //   onChanged: (val) {
      //     setState(
      //       () {
      //           dropDownValue = val.toString();
      //       },
      //     );
      //   },
      // ),
      //        ),
      //        SizedBox(height: 30,),
      //        Container(
      //          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: HexColor("#f8d8df")),
      //          padding: EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
      //          height:50 ,
      //          width: 180,
      //          child: DropdownButton(
      //            dropdownColor: HexColor("#f8e7eb"),
      //            borderRadius: BorderRadius.circular(7),
      //   hint: dropDownValue2 == null
      //       ? Text('Diet',style: TextStyle(fontSize: 19),)
      //       : Text(
      //             dropDownValue2!,
      //             style: TextStyle(color: kPrimaryColor),
      //           ),
      //   isExpanded: true,
      //   iconSize: 30.0,
      //   icon: dropDownValue2==null? Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
      //   style: TextStyle(color: kPrimaryColor,fontSize: 19),
      //   items: ['Vegan Diet', 'Paleo Diet', 'High-Fiber','Gluten-Free','Low-fat Diet'].map(
      //     (val2) {
      //       return DropdownMenuItem<String>(
      //           value: val2,
      //           child: Text(val2),
      //       );
      //     },
      //   ).toList(),
      //   onChanged: (val2) {
      //     setState(
      //       () {
      //           dropDownValue2 = val2.toString();
      //       },
      //     );
      //   },
      // ),
      //        ),
      //        SizedBox(height: 30,),
      //        Container(
      //          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: HexColor("#f8d8df")),
      //          padding: EdgeInsetsDirectional.fromSTEB(17, 0, 0, 0),
      //          height:50 ,
      //          width: 180,
      //          child: DropdownButton(
      //            dropdownColor: HexColor("#f8e7eb"),
      //            borderRadius: BorderRadius.circular(7),
      //   hint: dropDownValue3 == null
      //       ? Text('Disease',style: TextStyle(fontSize: 19),)
      //       : Text(
      //             dropDownValue3!,
      //             style: TextStyle(color: kPrimaryColor),
      //           ),
      //   isExpanded: true,
      //   iconSize: 30.0,
      //   icon: dropDownValue3==null? Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_down,color: kPrimaryColor,),
      //   style: TextStyle(color: kPrimaryColor,fontSize: 19),
      //   items: ['Pregnancy', 'Diabetes', 'Obesity'].map(
      //     (val2) {
      //       return DropdownMenuItem<String>(
      //           value: val2,
      //           child: Text(val2),
      //       );
      //     },
      //   ).toList(),
      //   onChanged: (val2) {
      //     setState(
      //       () {
      //           dropDownValue3 = val2.toString();
      //       },
      //     );
      //   },
      // ),
      //        ),
      //        SizedBox(height: size.height * 0.11),
      //        SizedBox(
      //          width: 140,
      //          height: 44,
      //          child: ElevatedButton(onPressed: (){}, child: Text("Submit",style: TextStyle(fontSize: 19,color: kPrimaryColor,fontWeight: FontWeight.bold),),style: ElevatedButton.styleFrom(primary: HexColor("#f8d8df"))))

      //       ],
      //     ),
      //   ),
    );
  }
}
