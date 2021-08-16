import 'package:flutter/material.dart';

class Utility {
  static String timeOfDayString(TimeOfDay time) {
    return time.toString();
  }

  static TimeOfDay getTimeOfDay(String time) {
    TimeOfDay timeOfDay = TimeOfDay(
        hour: int.parse(time.split(":")[0]),
        minute: int.parse(time.split(":")[1]));
    return timeOfDay;
  }
}
