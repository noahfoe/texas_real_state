import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAboutPage extends StatefulWidget {
  late String email;
  MyAboutPage({required this.email, Key? key}) : super(key: key);

  @override
  _MyAboutPageState createState() => _MyAboutPageState(email: email);
}

class _MyAboutPageState extends State<MyAboutPage> {
  late String email;
  static const _noahUrl = "https://github.com/noahfoe";
  static const _ryanUrl = "https://github.com/?????";
  static const _dillionUrl = "https://github.com/DillonBlankenship";
  static const _tannerUrl = "https://github.com/?????";
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
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'This app was created for Professor Rodion Podorozhny in CS 4398.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'We aim to make it easier for people to find real estate in their area.  ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // Meet the team part (Links to GitHub accounts)
                        Text(
                          'Meet the group: (Click the picture to go to their github)',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _launchNoahGithub();
                                      },
                                      child: Row(
                                        children: [
                                          Text("Noah Foley"),
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                          ),
                                          Image.network(
                                            "https://tinyurl.com/ym9nhufb",
                                            scale: 3,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _launchRyanGithub();
                                      },
                                      child: Row(
                                        children: [
                                          Text("Ryan Granado"),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15)),
                                          Image.network(
                                            'https://tinyurl.com/dx2tfzyc',
                                            scale: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _launchDillionGithub();
                                },
                                child: Row(
                                  children: [
                                    Text("Dillon Blankenship"),
                                    Image.asset(
                                      'img/txst-logo.png',
                                      scale: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _launchTannerGithub();
                                },
                                child: Row(
                                  children: [
                                    Text("Tanner Harvey"),
                                    Image.asset(
                                      'img/txst-logo.png',
                                      scale: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text("© 2021 Texas Real State"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchTannerGithub() async => await canLaunch(_tannerUrl)
      ? await launch(_tannerUrl)
      : throw 'Could not launch $_tannerUrl';

  void _launchDillionGithub() async => await canLaunch(_dillionUrl)
      ? await launch(_dillionUrl)
      : throw 'Could not launch $_dillionUrl';

  void _launchRyanGithub() async => await canLaunch(_ryanUrl)
      ? await launch(_ryanUrl)
      : throw 'Could not launch $_ryanUrl';

  void _launchNoahGithub() async => await canLaunch(_noahUrl)
      ? await launch(_noahUrl)
      : throw 'Could not launch $_noahUrl';
}
