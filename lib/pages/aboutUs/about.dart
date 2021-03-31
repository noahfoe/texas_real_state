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
  static const _ryanUrl = "https://github.com/Specialist111";
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'About Us',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '    Texas Real State is developed by Texas State Students with Flutter. Founded in 2021.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '    This app was created for Professor Rodion Podorozhny in CS 4398.',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '    Our goal was to create a centralized place for people to discover their new living space at Texas State University  ',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Meet the team part (Links to GitHub accounts)
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Meet The Team: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Column(
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
                                          Image.network(
                                            "https://tinyurl.com/ym9nhufb",
                                            scale: 3,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 15),
                                          ),
                                          Text("Noah Foley"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _launchRyanGithub();
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Image.network(
                                            'https://tinyurl.com/dx2tfzyc',
                                            scale: 3,
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15)),
                                          Text("Ryan Granado"),
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
                          height: 15,
                        ),
                        Container(
                          child: Column(
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'img/dillon.jpg',
                                      scale: 23,
                                      width: 60,
                                      height: 75,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("Dillon Blankenship"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _launchTannerGithub();
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'img/tanner.jpg',
                                      scale: 5,
                                    ),
                                    SizedBox(
                                      width: 17,
                                    ),
                                    Text("Tanner Harvey"),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
