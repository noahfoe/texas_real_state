import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MyGalleryPage extends StatefulWidget {
  MyGalleryPage({Key? key}) : super(key: key);

  @override
  _MyGalleryPageState createState() => _MyGalleryPageState();
}

class _MyGalleryPageState extends State<MyGalleryPage> {
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
              child: Text(
                'Gallery',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
