import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContactPage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  MyContactPage({required this.email, required this.firstName, required this.lastName, Key? key}) : super(key: key);

  @override
  _MyContactPageState createState() => _MyContactPageState(email: email);
}

class _MyContactPageState extends State<MyContactPage> {
  late String email;
  _MyContactPageState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(
        email: email, firstName: '', lastName: ''
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[200],
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "We want to hear your feedback!",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Name:",
                    border: InputBorder.none,
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Email:",
                    border: InputBorder.none,
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Message:",
                    border: InputBorder.none,
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 40)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  onPressed: () {},
                  child: Text("SUBMIT",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 55,
                ),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await launch("mailto:TexasRealState@gmail.com");
                        },
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(Icons.email),
                            Text(
                              ' TexasRealState@gmail.com',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      GestureDetector(
                        onTap: () async {
                          await launch("tel:123 456 7890");
                        },
                        child: Row(
                          children: [
                            Spacer(),
                            Icon(FontAwesomeIcons.phoneSquareAlt),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              ' (123) 456-7890',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () async {
                              await launch(
                                  "https://instagram.com/TexasRealState");
                            },
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.instagramSquare),
                                Text(
                                  ' @TexasRealState',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Text(" | "),
                          GestureDetector(
                            onTap: () async {
                              await launch(
                                  "https://twitter.com/TexasRealState");
                            },
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.twitter),
                                Text(
                                  ' @TexasRealState',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text("© 2021 Texas Real State"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
