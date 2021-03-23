import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_texas_state/components/maps/location/location_provider.dart';
import 'package:real_texas_state/pages/home/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: MyHomePage(),
        ),
      ],
      child: MaterialApp(
        title: 'Texas Real State',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
