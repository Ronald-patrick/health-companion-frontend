import 'package:flutter/material.dart';
import 'package:miniproject/Screens/Ads/AdDetails.dart';
import 'package:miniproject/Screens/Ads/AdInfo.dart';
class AdScreen extends StatefulWidget {
  const AdScreen({ Key? key }) : super(key: key);

  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AdDetails(day: DateTime.april,unit: 1,title:"Meet",aid: "",),
    );
  }
}