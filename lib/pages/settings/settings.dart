import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MySettingsPage extends StatefulWidget {
  late String email;
  MySettingsPage({required this.email, Key? key}) : super(key: key);

  @override
  _MySettingsPageState createState() => _MySettingsPageState(email: email);
}

class _MySettingsPageState extends State<MySettingsPage> {
  late String email;
  _MySettingsPageState({required this.email});

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
            child: Center(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
