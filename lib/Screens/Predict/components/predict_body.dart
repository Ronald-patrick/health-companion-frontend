// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniproject/Screens/Predict/components/background.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/components/rounded_button.dart';
import 'package:miniproject/constants.dart';

File? image;
final picker = ImagePicker();

class PredictComponent extends StatefulWidget {
  const PredictComponent({Key? key}) : super(key: key);

  @override
  _PredictComponentState createState() => _PredictComponentState();
}

class _PredictComponentState extends State<PredictComponent> {
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
      // } else {
      //   image = "./"
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Pneumonia Detection",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 21),
            ),
            SizedBox(height: size.height * 0.21),
            Column(
              children: [
                Container(
                    child: image != null
                        ? ClipRRect(
                            child: Image.file(
                              image!,
                              width: 250,
                              height: 250,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Text(
                            'Please Input Xray',
                            style: TextStyle(color: kPrimaryColor),
                          )),
                SizedBox(height: size.height * 0.06),
                RoundedButton(
                  text: "Select",
                  press: () async {
                    getImage();
                  },
                ),
                RoundedButton(
                  text: "Predict",
                  press: () async {
                    Api().imgUpload(context, "passed", image);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
