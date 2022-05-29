import 'package:flutter/material.dart';
import 'package:miniproject/Screens/Diet/components/selectdiet_body.dart';

class SelectDiet extends StatefulWidget {
  const SelectDiet({ Key? key }) : super(key: key);

  @override
  _SelectDietState createState() => _SelectDietState();
}

class _SelectDietState extends State<SelectDiet> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: const [
          
          SelectDietComponent(
          ),
        ],
    );
  }
}