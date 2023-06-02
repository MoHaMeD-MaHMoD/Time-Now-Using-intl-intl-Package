import 'package:flutter/material.dart';
import "dart:async";
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  // Time
  String weekDay = "";
  String date = "";
  String time = "";

  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Time
        weekDay = DateFormat('EEEEE').format(DateTime.now());
        date = DateFormat('MMM d, y ').format(DateTime.now());
        time = DateFormat('hh : mm : ss a').format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time & Date App",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        backgroundColor: Color.fromRGBO(49, 91, 125, 0.8),
      ),
      backgroundColor: Color.fromRGBO(70, 130, 180, 0.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $weekDay   ",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              date,
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              time,
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
