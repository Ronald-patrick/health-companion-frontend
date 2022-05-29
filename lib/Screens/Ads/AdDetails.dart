import 'package:flutter/material.dart';
import 'package:miniproject/Screens/config/palette.dart';

import 'package:miniproject/Screens/Ads/AdInfo.dart';
import 'package:miniproject/Screens/Ads/AdPosts.dart';
import 'package:miniproject/api/api.dart';

import 'package:miniproject/constants.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

Api api = Api();

class AdDetails extends StatefulWidget {
  String aid;
  String title;
  int day;
  int unit;
  AdDetails(
      {Key? key,
      required this.title,
      required this.day,
      required this.unit,
      required this.aid})
      : super(key: key);

  @override
  State<AdDetails> createState() => _AdDetailsState();
}

class _AdDetailsState extends State<AdDetails> {
  List<dynamic>? posts;

  int selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void getData() async {
    final data = await api.getAllPost(context, widget.aid);
    setState(() {
      print("API DATA");
      posts = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.secondary,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: kPrimaryColor,
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: Palette.secondary,
        selectedItemColor: kPrimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
              size: 30,
            ),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 30),
            label: 'Details',
          ),
        ],
      ),
      body: [
        (posts==null)
            ? const Center(child: CircularProgressIndicator())
            : AdPosts(aid: widget.aid, posts: posts??[],getData:getData),
        AdInfo(title: widget.title, day: widget.day, unit: widget.unit)
      ].elementAt(selectedIndex),
    );
  }
}
