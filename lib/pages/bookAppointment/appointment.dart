import 'package:flutter/material.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/components/my_drawer.dart';
import 'package:real_texas_state/pages/bookAppointment/calendar.dart';

class MyAppointmentPage extends StatefulWidget {
  late String email;
  late String firstName;
  late String lastName;
  MyAppointmentPage({required this.email, required this.firstName, required this.lastName, Key? key}) : super(key: key);

  @override
  _MyAppointmentPageState createState() =>
      _MyAppointmentPageState(email: email);
}

class _MyAppointmentPageState extends State<MyAppointmentPage> {
  late String email;
  _MyAppointmentPageState({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(
        email: email, firstName: '', lastName: ''
      ),
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
