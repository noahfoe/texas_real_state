import 'package:flutter/material.dart';
import 'package:real_texas_state/pages/aboutUs/about.dart';
import 'package:real_texas_state/pages/bookAppointment/appointment.dart';
import 'package:real_texas_state/pages/contactUs/contact.dart';
import 'package:real_texas_state/pages/gallery/gallery.dart';
import 'package:real_texas_state/pages/home/home.dart';
import 'package:real_texas_state/pages/settings/settings.dart';
import 'package:real_texas_state/pages/loginPage/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth = FirebaseAuth.instance;
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
            accountEmail: Text("UserName@email.com"),
            currentAccountPicture: CircleAvatar(child: Text('U')),
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
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new MySettingsPage(),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Sign Out'),
                    onPressed: () {
                      auth.signOut();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => new MyLoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Text("© 2021 Texas Real State")
        ],
      ),
    );
  }
}
