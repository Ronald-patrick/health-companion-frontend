// ignore_for_file: unnecessary_const

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:miniproject/Screens/Ads/Adhome.dart';
import 'package:miniproject/Screens/Ads/Explore.dart';
import 'package:miniproject/Screens/config/palette.dart';
import 'package:miniproject/Screens/Ads/AdDetails.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/constants.dart';
import 'package:miniproject/home.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

DateTime now = new DateTime.now();
TextEditingController title = TextEditingController();
TextEditingController unit_price = TextEditingController();
TextEditingController start = TextEditingController();
TextEditingController end = TextEditingController();
final _formKey2 = GlobalKey<FormState>();
Api api = new Api();
var info1;
DateTime finalday = new DateTime.now();
int itemCount = 0, final1 = 0, money = 0;
read(BuildContext context, Response info) async {
  info1 = await json.decode(info.body);
  print(info1);
  itemCount = json.decode(info.body).length;
  print(info1);
  print(info1[0]["aid"]);
  // finalday = DateTime.parse(info1[0]['startDate']);
  // print(finalday);
  // final1 = now.difference(finalday).inDays;
  print(final1);
  money = info1[0]["unit_price"].toInt();

  return info1;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> ads = [];
  @override
  void initState() {
    getData();
  }

  void getData() async {
    final data = await api.info(context);
    setState(() {
      ads = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text('Ronald Patrick'),
                accountEmail: const Text('ronald@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/66828049?v=4',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.explore,
                  size: 30,
                ),
                title: const Text(
                  'Explore',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Explore()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_box,
                  size: 30,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  size: 30,
                ),
                title: const Text(
                  'Exit',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyStatefulWidget()));
                },
              ),
            ],
          ),
        ),
        backgroundColor: Palette.secondary,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text('Fight Addiction'),
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
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text('Login'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey2,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              initialValue: null,
                              controller: title,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                labelText: 'Title',
                                icon: const Icon(
                                  Icons.account_box,
                                ),
                              ),
                              validator: (val) {
                                if (title.text == null || title.text.isEmpty) {
                                  return 'Title is empty';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                                controller: unit_price,
                                decoration: const InputDecoration(
                                  labelText: 'Unit Price',
                                  icon: const Icon(Icons.email),
                                ),
                                validator: (val) {
                                  if (unit_price.text == null ||
                                      unit_price.text.isEmpty) {
                                    return 'Price is empty';
                                  }
                                  return null;
                                }),
                            TextFormField(
                              validator: (val) {
                                if (start.text == null || start.text.isEmpty) {
                                  return 'Date is empty';
                                }
                                return null;
                              },
                              controller: start,
                              decoration: const InputDecoration(
                                labelText: 'Start Date',
                                icon: Icon(Icons.message),
                              ),
                            ),
                            TextFormField(
                                controller: end,
                                decoration: const InputDecoration(
                                  labelText: 'End Date',
                                  icon: Icon(Icons.message),
                                ),
                                validator: (val) {
                                  if (end.text == null || end.text.isEmpty) {
                                    return 'Date is empty';
                                  }
                                  return null;
                                }),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          // ignore: prefer_const_constructors
                          style:
                              ElevatedButton.styleFrom(primary: kPrimaryColor),
                          child: const Text("Submit"),
                          onPressed: () async {
                            setState(() {
                              print("okay");
                              if (_formKey2.currentState!.validate()) {
                                // print(title.text);
                                // print(unit_price.text);
                                // print(start.text);
                                // print(end.text);
                                api.createAddiction(context);

                                print("object1");
                              }
                            });
                          })
                    ],
                  );
                });
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ));
  }
}

class AdCard extends StatelessWidget {
  String title;
  int day;
  int unit;
  String aid;
  AdCard(
      {Key? key,
      required this.title,
      required this.day,
      required this.unit,
      required this.aid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          print(unit);
          print(day);
          print(title);
          print(info1);
          print("title");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AdDetails(
                      aid: aid,
                      title: title,
                      unit: unit,
                      day: day,
                    )),
          );
        },
        child: Container(
          height: 200,
          width: double.infinity,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 10,
            color: Colors.white,
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
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Palette.main),
                      ),
                      const Text(
                        'Money Saved',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ' + unit.toString(),
                        style:
                            const TextStyle(fontSize: 25, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 10.0,
                  percent: day / 100,
                  center: Text(day.toString() + " days",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  progressColor: Palette.main,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
