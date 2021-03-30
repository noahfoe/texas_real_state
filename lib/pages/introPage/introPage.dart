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
        title: "Texas Real State",
        image: Image.network(
            'https://clipart.info/images/ccovers/1495751366Yellow-House-PNG-Clip-Art.png',
            scale: 2),
        body: 'Real Estate Sold Here',
        footer: Text('@Texas Real State'),
      ),
      PageViewModel(
        title: "Easy way to find your new apartment",
        image: Image.network(
          'https://www.pinclipart.com/picdir/big/8-88292_apartment-complex-clipart-apartment-house-apartment-building-clipart.png',
          scale: 2,
        ),
        body: 'Find Apartments near Texas State University!',
        footer: Text('@Texas Real State'),
      ),
      PageViewModel(
        title: "We will ask to access location!",
        image: Image.network(
          'https://lh3.googleusercontent.com/proxy/JkerRgRjGCeT7K4PDzoxBYu1TjNAbo44vgnGxy5N90kyV6afXv85kIMwMtjP5IXkfLMFdHK7RqtrjwU2i26K83DJU9aaXTHyqlPoWKT6p8eUvXCbtRe1CDWN_locCQ',
          scale: 2,
        ),
        body: 'We use Google Maps and will need your location services enabled',
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
