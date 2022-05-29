import 'package:flutter/material.dart';
import 'package:miniproject/Screens/Predict/components/predict_body.dart';

class Predict extends StatefulWidget {
  const Predict({Key? key}) : super(key: key);

  @override
  _PredictState createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return  Column(
        children: const [
          
          PredictComponent(
          ),
        ],
      );
  }
}
