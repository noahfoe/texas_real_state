import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';

class MyAboutPage extends StatefulWidget {
  late String email;
  MyAboutPage({required this.email, Key? key}) : super(key: key);

  @override
  _MyAboutPageState createState() => _MyAboutPageState(email: email);
}

class _MyAboutPageState extends State<MyAboutPage> {
  late String email;
  _MyAboutPageState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(email: email),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'About Us',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Texas Real State is developed by Texas State Students with Flutter. Founded in 2021.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'This app was created for Professor Rodion Podorozhny in CS 4398.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'We aim to make it easier for people to find real estate in their area.  ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Meet the team part (Links to GitHub accounts)
                        Text(
                          'Meet the group:',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        Container(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 55,
                            ),
                            Text("Noah Foley"),
                            Image.asset(
                              'img/txst-logo.png',
                              scale: 10,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Ryan Granado"),
                            Image.asset(
                              'img/txst-logo.png',
                              scale: 10,
                            ),
                          ],
                        )),

                        Container(
                            child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Dillon Blankenship"),
                            Image.asset(
                              'img/txst-logo.png',
                              scale: 10,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text("Tanner Harvey"),
                            Image.asset(
                              'img/txst-logo.png',
                              scale: 10,
                            ),
                          ],
                        )),

                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
