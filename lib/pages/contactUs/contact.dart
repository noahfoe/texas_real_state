import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MyContactPage extends StatefulWidget {
  late String email;
  MyContactPage({required this.email, Key? key}) : super(key: key);

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
        email: email,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Email: TexasRealState@gmail.com',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        'Phone: 123-456-7890',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        'Twitter: @TexasRealState',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        'Instagram: @TexasRealState',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
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
