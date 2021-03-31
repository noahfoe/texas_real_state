import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_texas_state/components/maps/location/location_provider.dart';
import 'package:real_texas_state/pages/home/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late String email;
  MyApp({required this.email});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: MyHomePage(
            email: email, firstName: '', lastName: ''
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Texas Real State',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(
          email: email, firstName: '', lastName: ''
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
