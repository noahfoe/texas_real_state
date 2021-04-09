import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class MyCalendar extends StatefulWidget {
  MyCalendar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  String _targetDate = "None";
  String timeSelected = "None";
  DateTime _currentDate = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (date, events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: 300.0,
      selectedDateTime: _currentDate,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.yellow)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
    );

    return new Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Center(
            child: Container(
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30.0,
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: new Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  _currentMonth,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )),
                TextButton(
                  child: Text('PREV'),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month - 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                ),
                TextButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month + 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: _calendarCarouselNoHeader,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade300),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 20)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _targetDate = _targetDateTime.toString();
                          _targetDate = convertDateTimeDisplay(_targetDate);
                          timeSelected = "11:00 AM on $_targetDate";
                        });
                      },
                      child: Text("11:00 AM"),
                    ),
                    SizedBox(width: 15),
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade300),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 20)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        setState(() {
                          _targetDate = _targetDateTime.toString();
                          _targetDate = convertDateTimeDisplay(_targetDate);
                          timeSelected = "12:30 PM on $_targetDate";
                        });
                      },
                      child: Text("12:30 PM"),
                    ),
                    SizedBox(width: 15),
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.blueGrey.shade300),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 20)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      onPressed: () {
                        setState(() {
                          _targetDate = _targetDateTime.toString();
                          _targetDate = convertDateTimeDisplay(_targetDate);
                          timeSelected = "3:00 PM on $_targetDate";
                        });
                      },
                      child: Text("3:00 PM"),
                    ),
                  ],
                ),
                Divider(height: 20),
                Text(
                  "Time Selected: $timeSelected",
                  style: TextStyle(fontSize: 17),
                ),
                ElevatedButton(
                  onPressed: () {
                    _targetDate = _targetDateTime.toString();
                    _targetDate = convertDateTimeDisplay(_targetDate);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Mark your calendar!"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "Thank you for booking an appointment with Texas Real State."),
                                Padding(padding: EdgeInsets.all(10)),
                                Text(
                                    "Your appointment is set for $timeSelected on $_targetDate!"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade300),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 20)),
                  ),
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
                SizedBox(height: 45),
                Text("© 2021 Texas Real State"),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('MM/dd/yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }
}
