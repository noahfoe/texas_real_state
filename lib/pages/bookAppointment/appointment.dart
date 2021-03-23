import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:real_texas_state/pages/bookAppointment/calendar.dart';

class MyAppointmentPage extends StatefulWidget {
  MyAppointmentPage({Key? key}) : super(key: key);

  @override
  _MyAppointmentPageState createState() => _MyAppointmentPageState();
}

class _MyAppointmentPageState extends State<MyAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: MyCalendar(
              title: 'Book an appointment',
            ),
          ),
        ],
      ),
    );
  }
}
