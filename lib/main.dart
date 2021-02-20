import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Texas Real State',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Texas Real State Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool onHomePage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [Image.asset('img/txst-logo.png')],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the homepage of Texas Real State',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text("Gallery"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ListTile(
              leading: Icon(Icons.event_available),
              title: Text("Book an Appointment"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ListTile(
              leading: Icon(Icons.child_care),
              title: Text("About Us"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ListTile(
              leading: Icon(Icons.add_call),
              title: Text("Contact Us"),
            ),
            Padding(
              padding: EdgeInsets.all(170),
            ),
            Text("© 2021 Texas Real State")
          ],
        ),
      ),
    );
  }
}
