import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class Clock extends StatelessWidget {
  DateTime dateTime = DateTime.now();
  String greetings() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  //.add(Duration(hours: -5, minutes: 00)).toUtc();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //  margin: EdgeInsets.all(30),
        child: AnalogClock(
          decoration: BoxDecoration(
              border: Border.all(
                width: 5.0,
                color: Colors.black,
              ),
              color: Colors.transparent,
              shape: BoxShape.circle),
          width: 150.0,
          isLive: true,
          hourHandColor: Colors.black,
          minuteHandColor: Colors.black,
          showSecondHand: true,
          numberColor: Colors.black87,
          showNumbers: true,
          showAllNumbers: true,
          textScaleFactor: 1.4,
          showTicks: true,
          //showDigitalClock: true,
          datetime: dateTime,
          secondHandColor: Colors.black,

          //datetime: DateTime(2022, 8, 1, 9, 12, 15),
        ),
      ),
    );
  }
}
