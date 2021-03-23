import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MyAboutPage extends StatefulWidget {
  MyAboutPage({Key? key}) : super(key: key);

  @override
  _MyAboutPageState createState() => _MyAboutPageState();
}

class _MyAboutPageState extends State<MyAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Texas Real State is developed by Texas State Students with Flutter.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          'The group memebers are: Noah Foley, Ryan Granado, Dillion Blankenship, and Tanner Harvey.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          'The name of the app is Texas Real State because we are from Texas State Univeristy and it is a Real Estate app.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
