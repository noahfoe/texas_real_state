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
              //Navigator.pop(context);
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
              //Navigator.pop(context);
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
              //Navigator.pop(context);
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
              //Navigator.pop(context);
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
              //Navigator.pop(context);
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
                  //Navigator.pop(context);
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
