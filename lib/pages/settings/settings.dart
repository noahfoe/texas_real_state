import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:real_texas_state/components/themes.dart';
import 'package:real_texas_state/pages/loginPage/login.dart';
import 'package:real_texas_state/pages/settings/editProfile.dart';

class MySettingsPage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  MySettingsPage(
      {required this.email,
      Key? key,
      required this.firstName,
      required this.lastName})
      : super(key: key);

  @override
  _MySettingsPageState createState() => _MySettingsPageState(
      email: email, firstName: firstName, lastName: lastName);
}

class _MySettingsPageState extends State<MySettingsPage> {
  bool status = false;
  late String email;
  late String firstName;
  late String lastName;
  late String checkEmail;
  final auth = FirebaseAuth.instance;
  _MySettingsPageState(
      {required this.email, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(email: email, firstName: firstName, lastName: lastName),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: Colors.grey[400],
            ),
            SizedBox(
              height: 10,
            ),
            buildChangePasswordSettingRow(context, "Change password"),
            buildProfileSettingsRow(context, "Profile settings"),
            buildLanguageSettingRow(context, "Language"),
            buildPrivacySettingRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),

            Row(
              children: [
                Icon(
                  Icons.notifications_active,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Switch Settings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: Colors.grey[400],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                Transform.scale(
                  scale: 0.5,
                  alignment: Alignment.centerRight,
                  child: FlutterSwitch(
                    width: 125.0,
                    height: 55.0,
                    valueFontSize: 25.0,
                    toggleSize: 45.0,
                    value: status,
                    borderRadius: 30.0,
                    padding: 8.0,
                    showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                        currentTheme.toggleTheme();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 40)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  auth.signOut();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => new MyLoginPage(),
                    ),
                  );
                },
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            ),
            Spacer(),
            //SizedBox(height: 15),
            Text("© 2021 Texas Real State"),
          ],
        ),
      ),
    );
  }

  GestureDetector buildPrivacySettingRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("There are no privacy and security settings yet"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildLanguageSettingRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Texas Real State is currently only supported in English"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildChangePasswordSettingRow(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        auth.sendPasswordResetEmail(email: email);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("We have sent a password reset email to $email"),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text("Please check your email to reset your password"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  GestureDetector buildProfileSettingsRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => new EditProfilePage(
                    email: email, firstName: firstName, lastName: lastName)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600]),
            ),
            Icon(Icons.arrow_forward_rounded, color: Colors.red)
          ],
        ),
      ),
    );
  }
}
