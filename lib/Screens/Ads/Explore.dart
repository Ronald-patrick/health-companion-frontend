import 'package:flutter/material.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/Screens/config/palette.dart';
import 'package:miniproject/constants.dart';
import 'package:miniproject/home.dart';

import '../HomeAd/homeAd.dart';
import 'Adhome.dart';

class Explore extends StatefulWidget {
  const Explore({ Key? key }) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}
Api api = new Api();
DateTime finalday = new DateTime.now();
DateTime now = new DateTime.now();

class _ExploreState extends State<Explore> {
  List<dynamic> ads = [];
  @override
  void initState() {
    getData();
  }

  void getData() async {
    final data = await api.explore(context);
    setState(() {
      ads = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.secondary,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('Explore'),
        ),
        body: ads.isNotEmpty
            ? ListView.builder(
                itemCount: ads.length,
                itemBuilder: (context, index) {
                  return AdCard(
                    aid: (ads[index]["aid"]).toString(),
                    title: (ads[index]["title"]).toString().replaceFirst(
                        ads[index]["title"][0],
                        (ads[index]["title"][0]).toString().toUpperCase()),
                    day: now
                        .difference(DateTime.parse(ads[index]['startDate']))
                        .inDays,
                    unit: ads[index]["unit_price"].toInt() *
                        now
                            .difference(DateTime.parse(ads[index]['startDate']))
                            .inDays,
                  );
                },
              )
            : const Center(
                child: Text("No Addiction"),
              ));
  }
}