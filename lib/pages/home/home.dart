import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:real_texas_state/components/maps/location/location_provider.dart';
import 'package:real_texas_state/components/maps/my_googleMap.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  late String email;
  MyHomePage({required this.email, Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState(email: email);
}

class _MyHomePageState extends State<MyHomePage> {
  late String email;
  _MyHomePageState({required this.email});

  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initilization();
  }

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(email: email),
      body: Container(
        width: _screenWidth,
        height: _screenHeight,
        child: Stack(
          children: [
            MyGoogleMap(),

            ListView(
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

            //buildFloatingSearchBar(),
          ],
        ),
      ),
    );
  }

  // Currently using different search bar
  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search location...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (value) {
        // TODO: Call your model, bloc, controller here.
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // TODO: Add a list of search history
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    backgroundBlendMode: BlendMode.darken,
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
