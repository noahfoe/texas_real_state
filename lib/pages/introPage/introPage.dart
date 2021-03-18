import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.network('https://tinyurl.com/ygecojn8'),
        body: 'Real Estate Sold Here',
        footer: Text('@Texas Real State'),
      ),
      PageViewModel(
        image: Image.network('https://tinyurl.com/yg63qlpj'),
        body: 'Find Apartments, Condos, and Houses Here!',
        footer: Text('@Texas Real State'),
      ),
      PageViewModel(
        image: Image.network('https://tinyurl.com/yg7o9uwu'),
        body: 'Location Services will be Used',
        footer: Text('@Texas Real State'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IntroductionScreen(
          done: Text(
            "Done",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onDone: () {},
          pages: getPages(),
          globalBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
