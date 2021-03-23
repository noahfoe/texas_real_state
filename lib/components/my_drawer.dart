import 'package:flutter/material.dart';
import 'package:real_texas_state/pages/aboutUs/about.dart';
import 'package:real_texas_state/pages/bookAppointment/appointment.dart';
import 'package:real_texas_state/pages/contactUs/contact.dart';
import 'package:real_texas_state/pages/gallery/gallery.dart';
import 'package:real_texas_state/pages/home/home.dart';
import 'package:real_texas_state/pages/settings/settings.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      MaterialPageRoute(builder: (context) => new MyHomePage());
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
                          // TODO: Add Firebase for userAuth
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new MyHomePage()));
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text("Gallery"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new MyGalleryPage()));
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Book an Appointment"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new MyAppointmentPage()));
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.child_care),
            title: Text("About Us"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new MyAboutPage()));
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          ListTile(
            leading: Icon(Icons.add_call),
            title: Text("Contact Us"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new MyContactPage()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new MySettingsPage()));
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
