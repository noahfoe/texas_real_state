import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_texas_state/components/maps/location/location_provider.dart';
import 'package:real_texas_state/components/maps/my_googleMap.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initilization();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: MyGoogleMap(),
    );
  }
}
