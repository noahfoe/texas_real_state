import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_texas_state/app.dart';
import 'package:real_texas_state/components/my_appBar.dart';

class VerifyScreen extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  VerifyScreen(
      {required this.email, required this.firstName, required this.lastName});

  @override
  _VerifyScreenState createState() => _VerifyScreenState(
      email: email, firstName: firstName, lastName: lastName);
}

class _VerifyScreenState extends State<VerifyScreen> {
  late String email;
  late String firstName;
  late String lastName;
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;

  _VerifyScreenState(
      {required this.email, required this.firstName, required this.lastName});

  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Verifification", style: TextStyle(fontSize: 25)),
            Divider(),
            Text('An email has been sent to ${user.email} please verify'),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyApp(
                email: email,
                firstName: firstName,
                lastName: lastName,
              )));
    }
  }
}
