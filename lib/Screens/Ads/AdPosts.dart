// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jiffy/jiffy.dart';
import 'package:miniproject/Screens/Ads/AdPostForm.dart';
import 'package:miniproject/Screens/HomeAd/homeAd.dart';
import 'package:miniproject/Screens/config/palette.dart';
import 'package:miniproject/api/api.dart';
import 'package:miniproject/Screens/Ads/AdDetails.dart';
import 'package:miniproject/constants.dart';

final _formKey1 = GlobalKey<FormState>();
TextEditingController aid = TextEditingController();
TextEditingController title1 = TextEditingController();
TextEditingController body = TextEditingController();
Api api = Api();
DateTime days = DateTime.now();
int icount = 0;
var post1;
readPost(BuildContext context, Response info1) async {
  post1 = await json.decode(info1.body);
  print(info1);

  icount = json.decode(info1.body).length;

  print(post1);
  print("Count " + icount.toString());
  // finalday = DateTime.parse(info1[0]['startDate']);
  // print(finalday);
  // final1 = now.difference(finalday).inDays;
  print(final1);

  return post1;
}

class AdPosts extends StatefulWidget {
  final String aid;
  final List<dynamic> posts;
  final Function getData;
  const AdPosts(
      {Key? key, required this.aid, required this.posts, required this.getData})
      : super(key: key);

  @override
  State<AdPosts> createState() => _AdPostsState();
}

class _AdPostsState extends State<AdPosts> {
  @override
  Widget build(BuildContext context) {
    icount = widget.posts.length;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Add Post'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              controller: title1,
                              decoration: const InputDecoration(
                                labelText: 'Title',
                                icon: Icon(Icons.email),
                              ),
                              validator: (val) {
                                if (title1.text == null ||
                                    title1.text.isEmpty) {
                                  return 'Title is empty';
                                }
                                return null;
                              }),
                          TextFormField(
                            validator: (val) {
                              if (body.text == null || body.text.isEmpty) {
                                return 'Body is empty';
                              }
                              return null;
                            },
                            controller: body,
                            decoration: const InputDecoration(
                              labelText: 'Body',
                              icon: Icon(Icons.message),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        // ignore: prefer_const_constructors
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        child: const Text("Submit"),
                        onPressed: () async {
                          setState(() {
                            if (_formKey1.currentState!.validate()) {
                              api.createPost(context, widget.aid);
                              widget.getData();
                              Navigator.pop(context);
                            }
                          });
                        })
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
      body: icount != 0
        ? ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                widget.posts[index]["title"].toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              widget.posts[index]["body"],
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            trailing: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  Jiffy(widget.posts[index]['created']).yMMMMd.toString(),
                  style: TextStyle(fontSize: 16)),
            ),
          ));
        },
      ) : Center(child: Text("No Posts"),),
    );
  }
}
