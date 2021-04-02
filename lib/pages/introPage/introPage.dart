import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:real_texas_state/pages/loginPage/login.dart';

class IntroPage extends StatelessWidget {
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => new MyLoginPage(),
      ),
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Welcome to Texas Real State",
        image: Image.network(
            'https://clipart.info/images/ccovers/1495751366Yellow-House-PNG-Clip-Art.png',
            scale: 8),
        body: 'An app created for students by students',
        footer: Text('@Texas Real State'),
      ),
      PageViewModel(
        title: "We will ask to access location!",
        image: Image.network(
          'https://www.jing.fm/clipimg/full/68-680340_gps-locator-map-location-navigation-direction-transparent-background.png',
          scale: 3,
        ),
        body:
            'We use Google Maps and will need your location services enabled, but do not worry, we do not collect any of this data',
        footer: Text('@Texas Real State'),
      ),
      PageViewModel(
        title: "Serach for your new apartment from any mobile device",
        image: Image.network(
          'https://www.pinclipart.com/picdir/big/8-88292_apartment-complex-clipart-apartment-house-apartment-building-clipart.png',
          scale: 10,
        ),
        body:
            'Find Apartments near Texas State University and get started to today!',
        footer: Text('@Texas Real State'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: IntroductionScreen(
              showNextButton: false,
              showSkipButton: false,
              done: Text(
                "Done",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onDone: () => _onIntroEnd(context),
              pages: getPages(),
              globalBackgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
