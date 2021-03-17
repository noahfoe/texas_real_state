import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_texas_state/state/fragment_state.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget _homePage = _page(Colors.white, "Home");
  Widget _galleryPage = _page(Colors.white, "Gallery");
  Widget _bookAppPage = _page(Colors.white, "Book An Appointment");
  Widget _aboutUsPage = _page(Colors.white, "About Us");
  Widget _contactUsPage = _page(Colors.white, "Contact Us");
  Widget _settingsPage = _page(Colors.white, "Settings");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read(fragmentProvider).state = _homePage as Container;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@email.com"),
            currentAccountPicture: CircleAvatar(child: Text('U')),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text("Adding new acount..."));
                        });
                  },
                  child: CircleAvatar(child: Icon(Icons.add)))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              context.read(fragmentProvider).state = _homePage as Container;
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text("Gallery"),
            onTap: () {
              context.read(fragmentProvider).state = _galleryPage as Container;
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Book an Appointment"),
            onTap: () {
              context.read(fragmentProvider).state = _bookAppPage as Container;
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.child_care),
            title: Text("About Us"),
            onTap: () {
              context.read(fragmentProvider).state = _aboutUsPage as Container;
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.add_call),
            title: Text("Contact Us"),
            onTap: () {
              context.read(fragmentProvider).state =
                  _contactUsPage as Container;
              Navigator.pop(context);
            },
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  context.read(fragmentProvider).state =
                      _settingsPage as Container;
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Text("© 2021 Texas Real State")
        ],
      ),
    );
  }
}

_page(Color color, String title) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    color: color,
    child: Center(
      child: Text(
        '$title',
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    ),
  );
}
