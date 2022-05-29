import 'package:flutter/material.dart';
import 'package:miniproject/Screens/HomeAd/homeAd.dart';
import 'package:miniproject/Screens/config/palette.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:miniproject/constants.dart';
import 'package:jiffy/jiffy.dart';

class AdInfo extends StatelessWidget {
  String title;
  int day;
  int unit;
  AdInfo(
      {Key? key,
      required this.title,
      required this.day,
      required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Money Saved',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '₹ ' + unit.toString(),
                        style: TextStyle(fontSize: 25, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 10.0,
                  percent: day / 100,
                  center: Text(day.toString() + " days",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  progressColor: kPrimaryColor,
                )
              ],
            ),
          ),
          Container(
            color: kPrimaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start Date :',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(Jiffy(now).subtract(days: day).yMMMMd.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Duration :',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(day.toString() + " days",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Unit Price : ',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text((day != 0 ? (unit / day) : unit).toString() + " ₹",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
