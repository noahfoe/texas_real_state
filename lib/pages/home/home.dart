import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:real_texas_state/components/maps/location/location_provider.dart';
import 'package:real_texas_state/components/maps/my_googleMap.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:real_texas_state/components/themes.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  MyHomePage(
      {required this.email,
      required this.firstName,
      required this.lastName,
      Key? key})
      : super(key: key);
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(email: email, firstName: firstName, lastName: lastName);
}

class _MyHomePageState extends State<MyHomePage> {
  late String email;
  late String firstName;
  late String lastName;
  _MyHomePageState(
      {required this.email, required this.firstName, required this.lastName});

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initilization();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainHomePage(
            email: email, firstName: firstName, lastName: lastName),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme);
  }
}

class MainHomePage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  MainHomePage(
      {required this.email,
      required this.firstName,
      required this.lastName,
      Key? key})
      : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState(
      email: email, firstName: firstName, lastName: lastName);
}

class _MainHomePageState extends State<MainHomePage> {
  late String email;
  late String firstName;
  late String lastName;
  _MainHomePageState(
      {required this.email, required this.firstName, required this.lastName});
  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(email: email, firstName: firstName, lastName: lastName),
      body: Container(
        width: _screenWidth,
        height: _screenHeight,
        child: Stack(
          children: [
            MyGoogleMap(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Location...",
                      suffixIcon: Icon(Icons.place),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
